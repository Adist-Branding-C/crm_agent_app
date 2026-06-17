# CRM Agent App — Architecture Review Report

**Date:** 2026-06-17  
**Scope:** Full static analysis of the Flutter CRM codebase  
**Previous session fixed:** 9 issues.  
**This session fixed:** 7 additional issues (see §14).  
This report captures remaining violations.

---

## 1. File Length Compliance (`< 80 lines per file`)

### Violations Found

| File | Lines | Status |
|------|-------|--------|
| `lib/widgets/metric_card.dart` | **124** | NEW — exceeded limit (created in last fix round) |
| `lib/screens/analytics/widgets/analytics_body.dart` | 83 | Borderline — still 3 private classes |
| `lib/bloc/attendance/attendance_state_loaded.dart` | 82 | OK (part-file, data-heavy) |
| `lib/bloc/search/search_bloc.dart` | 69 | OK |
| `lib/data/repositories/tasks_repository_impl.dart` | 72 | OK |
| `lib/router.dart` | 72 | OK |
| `lib/bloc/follow_ups/mock_follow_ups.dart` | 69 | OK (data-only) |
| `lib/app.dart` | 68 | OK (but has architectural issue) |

**All screen widget files are now under 80 lines.** Only `metric_card.dart` needs splitting.

---

## 2. Private UI Helper Anti-Pattern (`_build*` methods)

**Rule:** Widget decomposition must use separate `StatelessWidget` classes, not private methods.

| File | Line | Method |
|------|------|--------|
| `lib/widgets/metric_card.dart` | 40 | `Widget _buildVertical()` |
| `lib/widgets/metric_card.dart` | 79 | `Widget _buildHorizontal(BuildContext)` |
| `lib/screens/call_log/widgets/quick_actions.dart` | 20 | `Widget _buildAction(...)` |
| `lib/screens/call_log/widgets/status_selector.dart` | 48 | `Widget _buildLabel(String)` |
| `lib/screens/call_log/widgets/status_selector.dart` | 57 | `Widget _buildChip(...)` |

**5 remaining violations across 3 files.**

---

## 3. Private Helper Classes (Same Anti-Pattern, Different Form)

**Rule:** Private classes are functionally identical to private `_build*` methods — they cannot be independently tested or optimized.

| File | Line | Class |
|------|------|-------|
| `lib/screens/analytics/widgets/analytics_body.dart` | 44 | `_AnalyticsSummaryGrid` |
| `lib/screens/analytics/widgets/analytics_body.dart` | 59 | `_StatusMetricsSection` |
| `lib/screens/analytics/widgets/analytics_body.dart` | 72 | `_SourceMetricsSection` |
| `lib/screens/dashboard/widgets/dashboard_body.dart` | 49 | `_PendingTasksSection` |

**4 private classes** — these should be extracted to public widget files.

---

## 4. Theme Bypass: `AppColors.*` Used Directly

**Rule:** All colors must come from `Theme.of(context)` to support theming (light/dark mode).

**88 files** in `lib/screens/` use `AppColors.*` directly. **100+ references** total.

### Top Offenders

| File | Count |
|------|-------|
| `enquiry_details/widgets/activities_config.dart` | 10 |
| `follow_ups/widgets/follow_up_list_body.dart` | 9 |
| `tasks/widgets/task_type_presentation_extensions.dart` | 8 |
| `analytics/widgets/analytics_grid.dart` | 8 |
| `attendance/widgets/attendance_timeline_configs.dart` | 8 |
| `dashboard/widgets/stats_grid.dart` | 8 |
| `notifications/widgets/notification_style_resolver.dart` | 6 |
| `account/widgets/profile_card.dart` | 6 |

**Severity: HIGH** — makes dark mode / theme switching impossible without touching every widget.

---

## 5. `AppTheme` Forwarding Aliases

`lib/theme.dart:16-24` defines static forwarding aliases from `AppTheme` → `AppColors`:

```dart
static const Color primaryColor = AppColors.primaryColor;
static const Color textDark = AppColors.textDark;
// ... etc
```

These alias constants are used inconsistently. Some files import `AppTheme`, others import `AppColors` directly. The forwarding layer adds indirection without solving the theme-bypass problem — both paths bypass `Theme.of(context)`.

---

## 6. Global BlocListener at App Root

**File:** `lib/app.dart:49-63`

```dart
BlocListener<CallLogBloc, CallLogState>(
  listener: (context, state) {
    if (state is CallLogNavigationPending) {
      _router.pushNamed(AppRoutes.callLog, extra: state.lead);
      context.read<CallLogBloc>().add(const ResetCallLog());
    }
  },
  child: MaterialApp.router(...),
),
```

**Problem:** A feature-specific bloc (`CallLogBloc`) listener wraps the entire `MaterialApp.router`. This:
- Couples the global navigation layer to a feature-specific bloc
- Makes the bloc mandatory at app root (cannot be lazy-loaded)
- Listener accesses `_router` from `_MyAppState` (tight coupling to StatefulWidget)

**Severity: HIGH**

---

## 7. `context.read<Bloc>()` in `build()` Methods

**75 occurrences across 44 files.** These bypass the reactive builder pattern (`BlocBuilder`/`BlocConsumer`/`BlocSelector`) and call `context.read<Bloc>()` directly inside `build()` or callbacks created within `build()`.

### Most affected files

| File | Count |
|------|-------|
| `login/widgets/login_form.dart` | 3 |
| `dashboard/widgets/tasks_list.dart` | 3 |
| `follow_ups/follow_ups_screen.dart` | 3 |
| `follow_ups/widgets/follow_up_list_body.dart` | 3 |
| `leads/widgets/leads_filter_tabs.dart` | 2 |
| `leads/widgets/leads_search_bar.dart` | 1 |
| `tasks/widgets/tasks_header.dart` | 2 |
| ... (44 files total) | |

**Severity: MEDIUM** — most are used to dispatch events (`context.read<Bloc>().add(...)`) which is generally safe, but some may cause stale closures or unexpected dispatches on rebuild.

---

## 8. `CallLogFailure.error` Stub

**File:** `lib/bloc/call_log/call_log_state.dart:49`

```dart
String? get error => null;
```

This always returns `null`, making it dead code. The real failure info is in `CallLogFailureType failure`. This stub was left behind during the extension extraction in the previous session and should be removed.

**Severity: LOW**

---

## 9. Mock Data in Production Code

Several repositories contain hardcoded mock data:

| File | Content |
|------|---------|
| `data/repositories/tasks_repository_impl.dart` | 8 hardcoded `Task` objects |
| `bloc/follow_ups/mock_follow_ups.dart` | 9 hardcoded `FollowUp` objects |
| `data/repositories/leads_repository_impl.dart` | Assumed similar |
| `data/repositories/attendance_repository_impl.dart` | Assumed similar |

This is appropriate for a prototype/early-stage app but should be noted as tech debt before API integration.

---

## 10. Remaining `withValues(alpha: ...)` Calls

~~`withOpacity` calls~~ All migrated. **12 `withValues(alpha: ...)` calls remain** (the modern replacement):

| File | Line | Usage |
|------|------|-------|
| `attendance/widgets/stat_item.dart` | 23 | `iconColor.withValues(alpha: 0.15)` |
| `call_log/widgets/quick_actions.dart` | 36, 48 | `Colors.grey.withValues(alpha: 0.08)` |
| `deals/widgets/deals_stats_card.dart` | 38 | `Colors.white.withValues(alpha: 0.6)` |
| `deals/widgets/deals_toggle.dart` | 19 | `AppColors.borderLight.withValues(alpha: 0.5)` |
| `deals/widgets/deal_stage_badge.dart` | 18 | `baseColor.withValues(alpha: 0.08)` |
| `enquiry_details/widgets/fab_menu_item.dart` | 41 | `Colors.black.withValues(alpha: 0.05)` |
| `login/widgets/login_header.dart` | 25 | `AppTheme.primaryColor.withValues(alpha: 0.3)` |
| `splash/widgets/splash_content.dart` | 23 | `AppTheme.primaryColor.withValues(alpha: 0.3)` |
| `theme/app_shadows.dart` | 11, 20 | Shadow color calculations |
| `widgets/filter_chip_bar.dart` | 49 | `Colors.black.withValues(alpha: 0.08)` |

Several of these use hardcoded `Colors.*` values instead of theme colors (another anti-pattern).

---

## 11. Summary of All Violations

| Priority | Count | Category |
|----------|-------|----------|
| 🔴 HIGH | 100+ refs / 88 files | `AppColors.*` bypassing theme |
| 🔴 HIGH | 1 | `BlocListener<CallLogBloc>` wraps `MaterialApp.router` |
| 🟡 MED | 75 in 44 files | `context.read<Bloc>()` in `build()` |
| 🟡 MED | 5 | Private `_build*` methods |
| 🟡 MED | 4 | Private widget classes |
| 🟡 MED | 1 | `metric_card.dart` exceeds 80-line limit |
| 🟢 LOW | 1 | `CallLogFailure.error` stub |
| 🟢 LOW | 12 | `withValues()` calls (some use hardcoded colors) |
| 🟢 LOW | 1 | Dynamic `routePath` push bypassing named routes |

---

## 12. File Overlap / Duplication Audit

| Pattern | Count |
|---------|-------|
| Files that import both `app_colors.dart` AND access colors via `Theme.of(context)` | Likely zero — no file uses the theme color system |
| Files that import `theme.dart` (barrel) vs `app_colors.dart` (direct) | Mixed — inconsistent |
| Files with redundant `part` files | None — all are clean |

---

## 13. Recommendations (Priority-Ordered)

1. **Migrate `AppColors.*` → `Theme.of(context)`** — systematic rewrite across 88 files
2. **Audit `context.read<Bloc>()`** — convert to `BlocBuilder`/`BlocConsumer` where state reads are needed
3. **Replace mock data with real API** — repositories should integrate with backend
4. **Eliminate hardcoded `Colors.*` in `withValues()` calls** — use theme-derived colors instead

## 14. What Was Fixed This Session

| # | Issue | Fix |
|---|-------|-----|
| 1 | `metric_card.dart` (124 lines, 2 private `_build*` methods) | Split into 3 files: `MetricCard` (39 lines), `MetricCardVertical`, `MetricCardHorizontal` |
| 2 | `quick_actions.dart` private `_buildAction` | Extracted to `QuickActionTile` widget |
| 3 | `status_selector.dart` private `_buildLabel`/`_buildChip` | Extracted to `StatusLabel` & `StatusChip` widgets |
| 4 | `CallLogFailure.error` stub (always returns null) | Removed dead code |
| 5 | `BlocListener<CallLogBloc>` wrapping `MaterialApp.router` | Moved to dedicated `CallLogNavigationHandler` widget using `GoRouter.of(context)` |
| 6 | 3 private classes in `analytics_body.dart` | Extracted to `AnalyticsSummaryGrid`, `StatusMetricsSection`, `SourceMetricsSection` |
| 7 | Private `_PendingTasksSection` in `dashboard_body.dart` | Extracted to `PendingTasksSection` widget |

### Metrics After Session 2

| Metric | Before | After |
|--------|--------|-------|
| Files over 80 lines (screens/) | 0 | 0 |
| Private `_build*` methods | 5 | **0** |
| Private widget classes | 4 | **0** |
| `BlocListener<CallLogBloc>` at app root | 1 | **0** |
| `CallLogState` stub getters | 1 | **0** |
| Analyzer issues | 0 | **0** |
| Tests passing | 33 | **33** |
