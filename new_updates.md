feat: comprehensive UI/UX design system overhaul

- Complete AppTextTheme with all 15 Material text style slots
  (added displayMedium, headlineLarge, headlineSmall, titleLarge,
  titleSmall, bodySmall, labelMedium, labelSmall)
- Add AppSpacing constants class with standardized spacing scale
  and EdgeInsets presets (xs=4 through massive=60)
- Add dark mode support (AppTheme.darkTheme) with full dark palette
- Add SnackBarTheme (floating, branded) to both light and dark themes
- Wire darkTheme + themeMode into MaterialApp.router

Unify card padding across all list-item cards to AppSpacing constants
(lead_card, task_card, task_row, follow_up_card, follow_up_item_card,
notification_item_widget, deal_list_card, profile_card,
checked_in_card_body, checked_out_card_body)

Fix visual/style bugs:
- DonutChart: displayLarge(32px) → headlineSmall(20px) to prevent overflow
- ScreenHeader: titleLarge(undefined) → headlineSmall(now defined)
- MetricCardVertical: headlineMedium(24px) → titleLarge(18px) for proportion
- CustomButton: hardcoded styleFrom → consume elevatedButtonTheme
- StatItem: runtime withValues(alpha:) → pre-computed alpha constants
- SelectionChip/FilterChipBar: direct scaleFont → theme-aware fontSize
- DashboardHeader: remove corrupted duplicate Text widgets

Remove redundant copyWith overrides: 10+ widgets now use theme styles
directly instead of re-declaring colors/weights already in the theme.

Add reusable EmptyStateWidget with icon, title, subtitle, and action.

Clean up imports: remove unused directives, fix duplicate imports,
reorder per convention.

style: unify button border radius to professional soft squares (8px)

Updates all primary, secondary, cancel, and action buttons in the CRM application from heavily curved/pill shapes (ranging from 10px to 20px) to a consistent and subtle border radius of 8px. This alignment establishes a more modern, human-designed aesthetic across the entire application interface.

Modified Components:
- Global Theme:
  - Elevated button theme default in app_button_theme.dart (14px -> 8px)
- Custom Buttons:
  - CardIconButton default shape (12px -> 8px)
  - ProfileActionButton shape (12px -> 8px)
  - CheckInButton & CheckOutButton shape (10px -> 8px)
  - SaveButton shape (16px -> 8px)
  - AddDealSubmitButton & EditEnquiryButton shape (16px -> 8px)
  - QuickActionButton & WhatsAppSendButton shape (12px -> 8px)
  - TaskTypeButton shape (10px -> 8px)
- Inline Screen Overrides:
  - Analytics FilterActionButtons shape (16px -> 8px)
  - EditProfileActions & ChangePasswordButtons shape (12px -> 8px)
  - EditEnquiryButtons cancel button & InfoTabView status button (12px -> 8px)
  - TaskDetailsBody toggle button & TasksFilterActions reset button (12px -> 8px)
  - HistorySummaryCheckoutRow & HistoryLeavesCard buttons (20px -> 8px)

  design: comprehensive UI/UX audit fixes across all screens

- Migrate Login, Attendance, ChangePassword, ForgotPassword to
  PageScaffold for consistent screen layout
- Replace all hardcoded EdgeInsets/SizedBox with AppSpacing constants
- Normalize ScreenHeader padding (remove inline overrides)
- Replace raw CircularProgressIndicator/ElevatedButton with
  AppLoadingWidget/AppErrorWidget/CustomButton
- Convert inline fontSize:13 styles to text theme tokens
- Increase bottom nav label from 11px to 12px for accessibility
- Fix calendar selection border to use primaryColor
- Add Semantics labels to tappable cards, buttons, chips
- Migrate DealsStatsCard from raw Container to CustomCard
- Remove unused imports; flutter analyze passes with 0 issues

style: remove all drop shadows for flat design

- Strip boxShadow, elevation, and shadow fields from 18 widget and theme files
- Delete AppShadows class and remove its import/export from AppTheme
- Purge shadow guidelines from ARCHITECTURE.md, rules.md, and new_updates.md

refactor: centralize all spacing into AppSpacing constants

- Add missing constants: xxs=2, xs2=6, ten=10, fourteen=14, hundred=100
- Add gap helpers: gapXxs, gapXxxl, gapWXxs, gapWXxl
- Add fabBottomPadding convenience inset
- Replace ~550 hardcoded spacing literals with AppSpacing.* references
  across 110+ widget files (EdgeInsets, SizedBox, Wrap spacing, etc.)
- Clean up unnecessary duplicate theme imports

refactor: centralize all spacing into AppSpacing constants

Add missing constants: xxs, xs2, ten, fourteen, hundred
Add gap helpers: gapXxs, gapXxxl, gapWXxs, gapWXxl
Add fabBottomPadding convenience inset
Replace ~550 hardcoded spacing literals with AppSpacing references across 110+ widget files
Clean up unnecessary duplicate theme imports

refactor(theme): split ThemeData and fix layout & dynamic theming bugs

- Decomposed `lib/theme.dart` into `app_theme_light.dart` and `app_theme_dark.dart` to strictly meet the under-80-line constraint.
- Updated `ThemeColors` BuildContext extension in `app_context_theme.dart` to fetch color values dynamically depending on theme brightness instead of using static light-theme constants.
- Reordered state checks in `TaskDetailsScreen` to check for error states first, fixing an infinite loading spinner when `TasksError` occurs.
- Fixed `ParentDataWidget` assertion failure in `StatsGrid` by placing `Expanded` outside the `Padding` widget inside the horizontal row.
- Corrected string interpolation in `LeadCardDetails` by removing backslash escapes (`\$` changed to `$`), restoring correct rendering of the lead source and status labels.

refactor: resolve architectural violations from code review

- Fix DIP layer violation: move all domain models from bloc/ to data/models/,
  update 24 data layer imports to remove bloc dependency, remove redundant
  TaskType enum declaration
- Replace Navigator.pop() with GoRouter context.pop() in call actions sheet
- Remove dead AuthRepository abstraction and orphan authDataSource wiring
- Remove business-logic getters from AnalyticsLoaded state
- Registry-drive auth route detection via AppRoutes.isAuthRoute set
- Eliminate duplicated responsive grids via shared ResponsiveQuadGrid
- Replace inline Colors.white/grey literals with AppColors tokens across 7 files
- Shrink app_theme_dark.dart below 80-line limit (extract dark input theme)