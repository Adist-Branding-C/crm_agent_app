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

