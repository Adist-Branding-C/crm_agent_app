# Architectural Review: CRM Agent App (Flutter)

**Review Date:** 2026-06-22  
**Reviewer:** Senior Flutter Architect  
**Codebase Version:** 1.0.0+1

---

## Executive Summary

| Aspect | Rating |
|---|---|
| **Structural Integrity** | B |
| **SOLID Compliance** | C+ |
| **Performance / Rebuild Safety** | B- |
| **80-Line Constraint Compliance** | F (1 violation + 3 part-file violations) |
| **Testability** | C |
| **Overall** | **C+ (Needs Improvement)** |

The codebase shows good intentionality — clean feature-first directory layout, repository abstraction layer, GoRouter usage, and Formz validation. However, there are significant violations of the **80-line file limit**, mixing of **`part` directives** that make files effectively much longer, **inconsistent BLoC patterns** (some blocs use parts, others don't), **global singleton BLoC for inherently local state**, and **leaked stream controllers**. Several SRP, DIP, and OCP violations are present.

---

## Critical Issues (Immediate Fixes Required)

### 1. `analytics_calculation_helper.dart` — Exactly 80 Lines (Violates `strictly under 80`)

**File:** `lib/data/repositories/analytics_calculation_helper.dart` — 80 lines

The project constraint states **every single file must be strictly under 80 lines**. This file is exactly 80 lines. Extract `calculateDealTypeMetrics` (lines 70-79) into a separate helper.

### 2. Login BLoC Uses `part` Directives — Effective File Exceeds 80 Lines

**File:** `lib/bloc/login/login_bloc.dart`

```dart
part 'login_event.dart';
part 'login_state.dart';
part 'login_inputs.dart';
```

This compiles into an effective single file of **64 + 14 + 67 + 70 = ~215 lines**. The `login_inputs.dart` content (LoginPhone, LoginPassword validators, AuthFailure enum, two validation error enums) should be **independent imports, not parts**. Same for `login_state.dart` and `login_event.dart`.

**Same violation in:**
- `lib/bloc/dashboard/dashboard_bloc.dart` (parts: event, state)
- `lib/bloc/analytics/analytics_bloc.dart` (parts: event, state)
- `lib/bloc/deals/deals_bloc.dart` (parts: event, state)
- `lib/bloc/campaigns/campaigns_bloc.dart` (parts: event, state)

**Rule:** Use `import` not `part` — parts are for code generation only.

### 3. LeadsBloc Mutable Caching Breaks State Immutability

**File:** `lib/bloc/leads/leads_bloc.dart:16`

```dart
List<Lead>? _allLeads;
```

The state holds `allLeads` alongside `LeadsLoaded.filteredLeads`, leading to **two sources of truth**. When `_allLeads` is mutated via `updateAllLeads()`, emitted states become stale. The full `allLeads` list should be part of `LeadsLoaded` state.

**Fix:** Include `allLeads` in `LeadsLoaded` and remove the instance variable.

### 4. AnalyticsFilterSheet Unsafe Cast

**File:** `lib/screens/analytics/widgets/analytics_filter_sheet.dart:22`

```dart
final s = context.read<AnalyticsBloc>().state as AnalyticsLoaded;
```

If the BLoC is in `AnalyticsInitial`, `AnalyticsLoading`, or `AnalyticsError` state when this sheet opens, this line **throws a runtime exception**. Guard with a check or use `state is AnalyticsLoaded`.

### 5. StreamControllers in LeadsRepositoryImpl Are Never Disposed

**File:** `lib/data/repositories/leads_repository_impl.dart:11-12`

```dart
final _deletedController = StreamController<String>.broadcast();
final _updatedController = StreamController<Lead>.broadcast();
```

`dispose()` is defined (line 63) but **never called**. The repository is a singleton created via `RepositoryProvider<LeadsRepository>`, and `dispose()` is only reachable if someone manually calls it. These controllers **leak memory** for the app's lifetime. Register a close callback or use `async*` streams.

### 6. Global CallLogBloc Causes Unnecessary Rebuilds Across All Screens

**File:** `lib/app_bloc_providers.dart:13-18`

`CallLogBloc` is provided at the **app root**. Any `BlocListener` or `BlocBuilder` for `CallLogBloc` anywhere in the tree rebuilds when a call is placed. The `CallLogBloc` state is a local/screen concern (call in progress, save success) and should be scoped to the `CallLogScreen` via a per-screen `BlocProvider`.

**Impact:** `DashboardScreen` watches `CallLogBloc` on line 44 of `dashboard_screen.dart`, creating a **cross-feature coupling** between the dashboard and call-log state machine.

---

## Architectural Improvements

### 7. SRP Violation: DashboardScreen Listens to CallLogBloc

**File:** `lib/screens/dashboard/dashboard_screen.dart:44-49`

```dart
BlocListener<CallLogBloc, CallLogState>(
  listener: (context, state) {
    if (state is CallLogSaveSuccess) {
      context.read<DashboardBloc>().add(const FetchDashboardData());
    }
  },
```

The dashboard screen should not know about `CallLogBloc`. This cross-feature listener creates implicit coupling. Use a fire-and-forget event bus or refresh the dashboard directly after the save action completes (e.g., in the `SaveCallLog` handler itself).

### 8. DIP Violation: AnalyticsRepositoryImpl Dependency Chain Is Implicit

**File:** `lib/data/providers/domain_providers.dart:27-30`

```dart
RepositoryProvider<AnalyticsRepository>(
  create: (context) => AnalyticsRepositoryImpl(
    leadsRepository: context.read<LeadsRepository>(),
    dealsRepository: context.read<DealsRepository>(),
  ),
),
```

`AnalyticsRepositoryImpl` depends on `LeadsRepository`, but `LeadsRepository` is provided in **`lead_providers.dart`**, while `AnalyticsRepository` is in **`domain_providers.dart`**. There is **no compile-time guarantee** that `LeadsRepository` exists in the ancestor tree when `AnalyticsRepository` is created. Restructure providers to enforce dependency ordering.

### 9. OCP Violation: Hardcoded Query-Param-to-Tab Mapping

**File:** `lib/router.dart:54-57`

```dart
final tab = state.uri.queryParameters['tab'];
final idx = DashboardNavigationConfig.tabRegistry[tab] ?? 0;
```

While `tabRegistry` is centralized, the **lookup + fallback logic** lives in `router.dart`. Router should not know about dashboard tab resolution. Move the resolution into `DashboardRouteProvider` or a separate factory.

### 10. Mixed Navigation Paradigms

The app uses both:
- **Declarative:** `GoRouter` (correct, for route definitions)
- **Imperative:** `context.push()`, `context.pop()` (in `lead_card.dart`, `enquiry_details_screen.dart`, `screen_header.dart`)

When using GoRouter, prefer `context.pushNamed()` / `context.goNamed()` consistently. `context.pop()` works on the GoRouter's navigator, but mixing with `Navigator.push()` from other contexts can cause route stack corruption.

### 11. Theme Leak: Hardcoded Hex Colors in Widgets

**File:** `lib/screens/analytics/widgets/analytics_filter_sheet.dart:69`

```dart
style: TextStyle(color: Color(0xFF1E293B), ...)
```

`0xFF1E293B` is `AppColors.textDark`. The theme extension `ThemeColors` (in `app_context_theme.dart`) provides `context.textDark`. Hardcoding hex values in widgets breaks themeability.

### 12. CallLogFormState Duplicates BLoC Responsibility

**File:** `lib/screens/call_log/models/call_log_form_state.dart`

This is a plain mutable model `copyWith` class for local form state. The same purpose could be served by the `CallLogBloc` state or by using `StatefulWidget` local state. Introducing a separate model class here creates confusion: why not use the BLoC state for form fields?

---

## Refactoring Suggestions & < 80 Line Violations

### 13. Split Login Bloc Parts Into Independent Files

Remove `part` directives from: `login_bloc.dart`, `dashboard_bloc.dart`, `analytics_bloc.dart`, `deals_bloc.dart`, `campaigns_bloc.dart`.

**Before (login_bloc.dart):**
```dart
part 'login_event.dart';
part 'login_state.dart';
part 'login_inputs.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> { ... }
```

**After:**
```dart
// login_bloc.dart
import 'login_event.dart';
import 'login_state.dart';
import 'login_inputs.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> { ... }
```

Then remove the `part of 'login_bloc.dart';` from the three part files.

### 14. Extract Analytics Calculation Helper

`analytics_calculation_helper.dart` is at exactly 80 lines. Extract `calculateDealTypeMetrics` into `deal_type_calculator.dart`:

**Before (analytics_calculation_helper.dart — 80 lines):**
```dart
static List<DealTypeMetric> calculateDealTypeMetrics(List<Deal> deals) {
  const types = ['New Admission', 'Corporate', 'Enquiry'];
  return types.map((t) { ... }).toList();
}
```

**After (new file: `deal_type_calculator.dart`):**
```dart
import '../../bloc/analytics/deal_analytics_models.dart';
import '../../bloc/deals/deals_models.dart';

List<DealTypeMetric> calculateDealTypeMetrics(List<Deal> deals) {
  const types = ['New Admission', 'Corporate', 'Enquiry'];
  return types.map((t) {
    final amt = deals.where((d) {
      final type = d.title.toLowerCase().contains('corporate')
          ? 'Corporate'
          : (d.stage == DealStage.newStage ? 'Enquiry' : 'New Admission');
      return type == t;
    }).fold(0.0, (sum, d) => sum + d.amount);
    return DealTypeMetric(dealType: t, amount: amt);
  }).toList();
}
```

### 15. LeadsBloc: Remove Mutable `_allLeads`, Use State Only

**Before (leads_bloc.dart):**
```dart
List<Lead>? _allLeads;
List<Lead> get allLeads => _allLeads ?? [];
void updateAllLeads(List<Lead> leads) => _allLeads = leads;
```

**After (leads_state.dart):**
```dart
class LeadsLoaded extends LeadsState {
  final List<Lead> allLeads;       // added
  final List<Lead> filteredLeads;  // stays
  ...
}
```

Move filtering logic to a pure function in `leads_filter_helper.dart` and always derive `filteredLeads` from `allLeads` in the event handler.

### 16. Scope CallLogBloc to CallLogScreen

**Before (app_bloc_providers.dart):**
```dart
BlocProvider<CallLogBloc>(
  create: (c) => CallLogBloc(leadsRepository: c.read(), ...),
),
```

**After (call_log_screen.dart):**
```dart
class CallLogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => CallLogBloc(leadsRepository: c.read(), activityRepository: c.read(), dialerService: const PhoneDialerService()),
      child: CallLogView(),
    );
  }
}
```

Then remove the global `BlocProvider<CallLogBloc>` from `app_bloc_providers.dart`.

### 17. Standardize on GoRouter Navigation

**Before (screen_header.dart):**
```dart
onTap: () => context.pop(),
```

**After:**
```dart
onTap: () => context.goNamed(AppRoutes.dashboard),
```

Or use `Navigator.of(context).pop()` only when you're certain the route was pushed on GoRouter's stack.

### 18. Disconnect DashboardScreen from CallLogBloc

Replace the `BlocListener<CallLogBloc>` in `dashboard_screen.dart` with a refresh that originates **from the save action itself**.

**Before:**
```dart
// DashboardScreen rebuilds when CallLog state changes
BlocListener<CallLogBloc, CallLogState>(
  listener: (context, state) {
    if (state is CallLogSaveSuccess) {
      context.read<DashboardBloc>().add(const FetchDashboardData());
    }
  },
```

**After:**
```dart
// In the SaveCallLog handler (call_log_handlers.dart), after save:
// Fire an event on a neutral event bus or simply navigate back
// DashboardScreen no longer listens to CallLogBloc at all.
```

### 19. Unify Timeline and Currency Formatting

The `AttendanceTimelineItem` and `EnquiryActivity` models are structurally similar (both have id, title, time, type). Consider a shared `TimelineEvent` model. Similarly, `CurrencyFormatter` is under `utils/` and is the only utility — consider extending its pattern for other formatters.

### 20. Fix StreamController Disposal

**Before (leads_repository_impl.dart):**
```dart
@override
void dispose() {
  _deletedController.close();
  _updatedController.close();
}
```

**After:** Register disposal at creation time:

```dart
// In lead_providers.dart or domain_providers.dart
RepositoryProvider<LeadsRepository>(
  create: (_) {
    final repo = LeadsRepositoryImpl(leadsDataSource: ds);
    // Register disposal
    // Alternatively, use a ServiceLocator with lifecycle hooks
    return repo;
  },
);
```

Or better, convert to `async*` generators that are garbage-collected when the stream subscription is cancelled.

---

## Additional Observations

| Finding | Severity | File |
|---|---|---|
| Inline `AppColors.textDark` used in styles instead of theme's TextTheme | Medium | `screen_header.dart:29`, `timeline_list.dart:21` |
| `_FilterTitle` uses `Color(0xFF1E293B)` instead of `AppColors.textDark` | Low | `analytics_filter_sheet.dart:69` |
| AttendanceData ↔ AttendanceLoaded duality creates data mapping overhead | Medium | `attendance_state_loaded.dart` + `attendance_mappers.dart` |
| TasksBloc `_onToggleTaskCompletion` silently swallows errors (empty catch) | Medium | `tasks_bloc.dart:44-46` |
| `LeadsRepository` not listed in `domain_providers.dart` — implicit dependency for `AnalyticsRepository` | High | `domain_providers.dart` |
| `CallLogFailure` states carry `leadName` but it's only set in one path | Low | `call_log_state.dart:46-47` |
| `analytics_calculation_helper.dart` static methods — no interface, untestable | Medium | `analytics_calculation_helper.dart` |
| DashboardTabNotifier persists index on every set, making the saved value always = last active index | Low | `dashboard_tab_notifier.dart:16` |

---

## File Length Compliance Summary

| Constraint | Status | Count |
|---|---|---|
| Files with `part` directives (effectively exceed 80 lines) | **FAIL** | 5 files |
| Files ≥ 80 lines (Dart) | **FAIL** | 1 file (`analytics_calculation_helper.dart`) |
| Files 70-79 lines | Ok but close to limit | ~30 files |
| Files < 70 lines | Compliant | Rest of codebase |

**Remediation:** Remove `part` directives from all 5 blocs (login, dashboard, analytics, deals, campaigns). Split `analytics_calculation_helper.dart` at line 70.

---

## Final Recommendations (Priority Ordered)

1. **CRITICAL:** Remove all `part` directives to comply with the 80-line constraint and improve testability.
2. **CRITICAL:** Make `LeadsRepository.dispose()` reachable — register a lifecycle callback or use a service locator.
3. **CRITICAL:** Guard the unsafe cast in `AnalyticsFilterSheet.initState()`.
4. **HIGH:** Scope `CallLogBloc` to the call log screen instead of globally.
5. **HIGH:** Move `LeadsRepository` into `domain_providers.dart` for explicit dependency ordering.
6. **HIGH:** Remove mutable `_allLeads` from `LeadsBloc`; store it in `LeadsLoaded` state.
7. **MEDIUM:** Replace `BlocListener<CallLogBloc>` in `DashboardScreen` with an event bus or handler-side refresh.
8. **MEDIUM:** Extract `calculateDealTypeMetrics` from `analytics_calculation_helper.dart`.
9. **MEDIUM:** Replace hardcoded hex colors with theme tokens.
10. **LOW:** Standardize all navigation to use `context.goNamed()` / `context.pushNamed()`.
