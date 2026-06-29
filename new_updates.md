### 1. Time-based follow-up categorization
- **FollowUp** model: `urgency` parameter replaced with `scheduledTime` DateTime + dynamic `urgency` getter
- **FollowUpCall** model: static `isOverdue` flag replaced with dynamic getter
- **add_follow_up_form.dart**: passes selected date/time as `scheduledTime`
- **Mock data**: updated to use `DateTime.now()`-relative values
- **New test**: `follow_up_logic_test.dart` for edge cases

### 2. Active filter indicator (Leads)
- Filter button turns red background + white icon when filters active
- "Clear" button appears in bottom sheet only when filters applied

### 3. Task details bottom sheet
- New widgets: `TaskDetailsBottomSheet`, `TaskDetailsActionBtn`, `TaskDetailsInfoRow`
- Wired to dashboard/task screen taps; mock data updated with realistic descriptions

### 4. Add Deal from Enquiry Details
- `DealsBloc` registered globally; `DealsScreen` consumes it
- `AddDealBottomSheetBody` uses `Navigator.pop(true)` instead of `context.pop(true)`
- New integration test: `enquiry_details_add_deal_test.dart`

### 5. Empty states (Activities & Notes tabs)
- Scrollable empty state in `ActivitiesTabView` and "No notes yet" in `NotesHistoryList`
- Widget tests added

### 6. Design system spacing/typography/components
- Spacing: `AppSpacing` values (xs2=3, md=9, lg=13, xl=17); FAB bottom padding 74
- Typography: half-point sizes, input 14.5, button 15
- Components: avatar 44px, badge pill-radius 999, KPI card padding, header buttons 36x36, icon chips radius 11-12, segmented controls, chips 7x13, bottom sheets (top radius 24, padding 11/17/29), progress bars (h7/h6), screen header, search fields, empty state icon 28

### 7. Button/input height reduction (-2px)
- Primary buttons: 13→12px, Save/Add Deal/Edit: 52→50px, text fields: 13→12px, search: 9→8px, date picker: 44→42px

### 8. Architectural audit fixes (C1-C4, M1-M7, Mi1)
- **C1**: `dispose()` on `SessionRepository`, DataSource in provider `create:`
- **C2**: Split `font_settings_screen.dart` 608→72 lines
- **C3**: `analytics_body` → StatefulWidget with IndexedStack
- **C4**: Move `callLogFailureMessage` to `error_messages.dart`, delete mock helper
- **M1**: Split analytics/search state into separate files
- **M2**: Move `.take(2)` filtering to presentation layer
- **M3**: Add `SendWhatsApp` event to `EnquiryDetailsBloc`
- **M4**: Add `primaryRed`/`primaryRedLight` tokens, replace 16 inline colors
- **M5**: Flatten provider tree 5→4 levels
- **M6**: Create `validation_patterns.dart` with 8 regex constants
- **M7**: Data-driven `AnalyticsTab.values.map()`
- **Mi1**: Exhaustive switch on `NotificationType` instead of `context.push()`

### 9. Architectural review fixes (P0-P3)
- **P0**: `buildWhen` on edit enquiry, remove `ChangeNotifier.addListener`, remove mock fallback
- **P1**: Decompose `font_settings_screen.dart` 636→112, split `analytics_repository_impl.dart` 120→54, extract `SectionTitle`
- **P2**: Abstract `HttpClient` interface, `AppStrings` 14→50+, `AppColors.surfaceWhite`
- **P3**: Parallel `DashboardBloc` fetch, memoize IndexedStack

### 10. SOLID/80-line/BLoC cleanup
- Fix hardcoded date, delete duplicate `verify_otp_failure.dart`, consolidate 37+ strings into `error_messages.dart`
- Extract `FollowUpSection` (105→56), data-driven `FabActions` (95→67), `ViewCallLogCubit`
- Split `filter_date_range_section.dart`, deduplicate analytics repo via helpers
- Remove business logic from state classes, fix analyzer issues

### 11. DIP/SRP/OCP/<80-line compliance
- **DIP**: `ViewCallLogCubit`, injectable `OtpTimerService`
- **SRP**: Split `FabActions` into 4 standalone widgets
- **OCP**: Data-driven `FollowUpListBody`
- **DRY**: Generic `_leadQuery`/`_dealQuery` dispatchers
- Split 14 files >80 lines: extract `PeriodChipRow`, `DateRangeRow`, `EditEnquiryFormController`, `SectionHeaderTitle`, `EmptyStateWidget`, `buildInputDecoration()`, `FilterFormData`, `FilterTitle`
- Replace magic string `'tab'` with `AppRoutes.tabQueryParam`

### 12. flutter_sfs responsive package
- Added `flutter_sfs: ^1.2.0` to pubspec.yaml
- Replaced `MediaQuery`/hardcoded sizes with `.sfsWidth`, `.sfsHeight`, `.sfsRadius` across 30+ files

### 13. Font settings screen
- New `FontSettingsScreen` at `lib/screens/settings/font_settings_screen.dart`
- Font style selection, preview, and persistence via app theme