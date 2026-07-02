style(deals): standardize typography and fix design inconsistencies

Refactors the Deals page components to align with the application's
centralized text themes and improve legibility:

- Replaces raw TextStyles with inherited text themes (labelMedium,
  labelSmall) in DealsToggleItem and DealStageBadge to support dynamic
  font choices.
- Standardizes title and amount font sizes across List and Pipeline cards,
  increasing the pipeline amount text size from 11.s to 12.s for better
  legibility.
- Uses appropriate text theme baselines (titleSmall, labelMedium) in 
  DealsStatsCard, DealPipelineStageHeader, and card components to resolve
  inconsistent font size overrides.
- Scales up extremely small font sizes (9.s -> 11.s) and calendar icons
  (8.s -> 12.s) to adhere to standard accessibility guidelines.
- Dynamically resolves DealStageBadge colors from stage.color instead of
  hardcoding primary light purple for all stages.
- Scaled LinearProgressIndicator corner radius (3 -> 3.r) and cleaned
  up unused imports across deals screen files.

  style(dashboard): unify typography hierarchy and design layout consistency

- Remove hardcoded `12.s` overrides in `MetricCardHorizontal` to re-establish proper primary (`titleSmall`/`14.s`) and secondary (`bodySmall`/`12.s`) text contrast.
- Standardize status/attendance text in `DashboardHeader` from hardcoded `10.s` to theme-based `bodySmall` (`12.s`) for improved readability.
- Replace hardcoded font sizes (`15.s`/`11.s`/`10.s`) in `FollowUpCard` and badges with theme-scaled typography (`titleSmall` / `labelSmall`).
- Refactor section titles and actions (`SectionHeaderTitle`, `SectionHeaderAction`) to utilize central `ThemeData` tokens (`titleMedium`, `labelMedium`).
- Standardize spacing gaps and card paddings on dashboard lists (`FollowUpsList`, `TasksList`) to use standard `AppSpacing.md` and `AppSpacing.cardPaddingCompact`.
- Clean up magic number spacing calculations in `NotificationBell` to use `3.w`.


style(campaigns): fix typography and layout inconsistencies on campaigns page

- Standardize card titles, subtitles, and captions to use theme-defined semantic styles (`titleSmall`, `labelSmall`, `labelMedium`) and remove manual font-size overrides.
- Refactor `CampaignsHeader` to use standard subtitle string configuration via `context.select`.
- Redesign `CampaignStatusBadge` to render as a styled pill container matching `DealStageBadge`, utilizing dynamic `campaign.themeColor` and displaying "Done" for completed campaigns.
- Fix stretched `CampaignIcon` box shape to a square `40.r x 40.r` container using `campaign.themeColor` and scaling icon size.
- Clean up unused imports in all modified widget files.

style(analytics): standardize typography and align visual layout

Refactors the Analytics page components to align with the application's
centralized text themes, satisfy the 80-line file length limit, and resolve visual inconsistencies:

- Replaces raw TextStyles and hardcoded font size overrides (11.s, 12.s, 13.s, 14.s, 15.s) with inherited text themes (titleSmall, labelLarge, labelMedium, labelSmall, bodyLarge) across all cards, dropdowns, and text fields.
- Extracts sub-widgets (`FilterButton`, `TabButton`, `CustomDateRangePicker`) to standalone files to strictly comply with the 80-line file size limit.
- Standardizes Reset and Apply button heights to a uniform `55.h` in the filter action buttons, fixing layout misalignment.
- Unifies card title styles to `titleSmall` across both `BarChartCard` and `DonutChartCard`.
- Standardizes metric text representations in `MetricCardVertical` to match `MetricCardHorizontal` without size overrides.
- Cleans up unused imports in modified files and verifies zero lint errors via `flutter analyze`.


style: align typography and layouts on Daily Activity screen

- Unified CheckInButton and CheckOutButton width (80.w), padding, and border radius (8.r), scaling button text to use labelMedium theme style.
- Standardized CheckedInInfo and CheckedOutInfo headers to use bodyLarge and metadata to use bodySmall, removing ad-hoc font size overrides.
- Cleaned up CheckedInInfo layout alignment for location and check-in time, removing the hanging middot separator.
- Simplified CheckedOutInfo layout by removing the redundant empty Row and horizontal gap.
- Updated Today's Timeline header in TimelineList to use themed titleMedium style.
- Standardized AttendanceTimelineTile to use titleSmall for titles and bodySmall for metadata/time, removing hardcoded font sizes.
- Fixed asymmetric padding on AttendanceHeader by changing to vertical-only padding, letting scaffold margins handle horizontal alignment.

style(profile): align typography and fix font-scaling inconsistencies

- Standardize typography by replacing raw TextStyles and hardcoded
  font sizes with standard Theme tokens (titleLarge, bodyMedium,
  headlineMedium, labelLarge, labelMedium, and bodySmall).
- Fix double-scaling layout bug in UserAvatar instances by passing
  raw double parameters instead of SFS-scaled sizes (.r/.s).
- Align OutlinedButton 'Cancel' typography and scaling with the
  adjacent ElevatedButton 'Save Changes'.
- Apply SFS scaling to the assignment icon size on the join date row.
- Clean up unused code by deleting the dead 'menu_item_widget.dart' file.
- Clean up unused imports in 'logout_button.dart' and 'edit_profile_form_layout.dart'.


style(account): standardize typography and layout on Edit Profile screen

Refactors the Edit Profile screen widgets to resolve typography, layout, and architectural inconsistencies:

- Replaces raw TextStyle in the Cancel button with Theme-derived bodyMedium to support custom font scaling.
- standardizes Cancel button shape borders with .r screen scaling and wraps OutlinedButton in a SizedBox with 65.h to resolve button height misalignment in edit_profile_actions.dart.
- Simplifies bodyMedium text styles in edit_profile_avatar_card.dart by removing redundant property overrides.
- Compacts properties, initializer, and build layout trees in edit_profile_form.dart and edit_profile_form_layout.dart to bring both files under the strict 80-line limit (each 76 lines).
- Removes commented-out dead code blocks from layout.
- Verifies clean build states via flutter analyze.

Summary of Completed Changes
Typography Standardized: Mapped all hardcoded and unscaled text style sizes (like 16, 15.s, 14, 14.s, 13, 13.5.s) in the widgets below to the central theme's scaled text styles:
activity_metadata_row.dart
 
→
→ Theme.of(context).textTheme.bodySmall
activity_status_badge.dart
 
→
→ Theme.of(context).textTheme.labelMedium
activity_title_row.dart
 
→
→ Theme.of(context).textTheme.titleSmall
my_activity_date_header.dart
 
→
→ Theme.of(context).textTheme.labelLarge
my_activity_empty_state.dart
 
→
→ Theme.of(context).textTheme.bodyMedium
my_activity_item.dart
 
→
→ Theme.of(context).textTheme.bodyMedium (for item description)
my_activity_lead_selector.dart
 
→
→ Theme.of(context).textTheme.bodyMedium
my_activity_type_filters.dart
 
→
→ Theme.of(context).textTheme.labelMedium
filter_sheet_title.dart
 
→
→ Theme.of(context).textTheme.titleMedium
filter_sheet_all_leads_row.dart
 
→
→ Theme.of(context).textTheme.bodyMedium
filter_sheet_lead_row.dart
 
→
→ Theme.of(context).textTheme.bodyMedium
Visual Hierarchy Restored: Reduced secondary metadata sizes in ActivityMetadataRow from 14.s to 12.s (bodySmall), establishing proper visual hierarchy under activity titles and descriptions.
Icons Scaled: Scaled filter sheet leading and trailing check icons (from 22/18 to 22.s/18.s) using the .s scaling suffix.
Code Cleaned: Resolved the unused import (context_text_extension.dart) in ActivityStatusBadge.
Verification Results
Static Analysis: flutter analyze completed successfully.
Unit and Integration Tests: flutter test was run, and all 53 tests passed with zero


I have successfully completed all the proposed fixes for the Call Report page.

Here is a summary of the work:

ScreenHeader Padding: Set the scalable header padding in 
call_report_screen.dart
 to match the rest of the application screens and fix the double-padding issue.
Standardized Card Title Typography: Updated the "Lead Status Breakdown" card title in 
lead_status_breakdown_card.dart
 to use the correct titleSmall style (fontSize: 16, bold).
Card Title & Alignment for Call Statuses: Added the card title "Call Status Breakdown" to 
call_status_list.dart
 and centered the chart to match the lead breakdown card.
Legend Typography Sizing: Normalized the text hierarchy inside 
lead_status_legend_item.dart
 to match other rows in the app.
Deleted Unused Code: Removed the redundant call_report_header.dart file.
Codebase Verification: Checked the code using flutter analyze and ran flutter test (all 53 tests passed successfully).


Summary of Fixes:
Typography Standardizations: Replaced all raw TextStyle wrappers and ad-hoc/unscaled font sizes (e.g. fontSize: 8.s, 9.s, 10.s or unscaled 13) across 20 widget files under 
lib/screens/attendance_history/widgets/
 with standard scaled themes (like titleSmall, labelSmall, labelMedium and bodySmall).
Code De-duplication: Refactored HistoryStatusBadge to reuse the status color resolver AttendanceStatusTheme.resolve(status), removing redundant conditional checks.
Scaling Fixes: Scaled the unscaled icon in HistoryCalendarOffDayDetail from raw size: 16 to size: 16.s.
Verification: Ran the automated tests successfully using flutter test test/attendance_history_test.dart.



### Change Password Screen Refactoring & Typography Alignment

*   **Page Scaffolding (`change_password_screen.dart`):**
    *   Set `padding: EdgeInsets.zero` on `PageScaffold` to prevent double horizontal padding when combined with child page headers.
*   **Page Layout & Header Spacing (`change_password_body.dart`):**
    *   Reduced `ScreenHeader` top padding from default `90.0.h` to `25.0.h` to avoid excessive blank space below the status bar.
    *   Added `AppSpacing.xl` (`17.w`) horizontal padding to the `SingleChildScrollView` to correctly align the forms and card elements with the header boundaries.
*   **Requirements Header Card (`change_password_header.dart`):**
    *   Replaced hardcoded borders (`12`) and lock icon sizes (`24`) with responsive/scalable equivalents (`12.r` and `24.s`).
    *   Scaled the description text to `12.s` and updated its color to `context.textMuted` for system-wide light/dark theme compatibility.
*   **Action Buttons (`change_password_buttons.dart`):**
    *   Aligned Cancel button (`OutlinedButton`) height to `65.h` using a `SizedBox` constraint to match the primary button's size.
    *   Changed border radius to `8.r` and updated typography to `14.s` with `FontWeight.bold` using the theme's `bodyMedium` base style.
    *   Disabled the Cancel button when form submission is in progress.
*   **Input Fields (`confirm_password_input.dart`, `current_password_input.dart`, `new_password_input.dart`):**
    *   Imported `package:flutter_sfs/flutter_sfs.dart` and scaled password visibility suffix icons to `20.s` (from `20`).

    Summary of Changes
Restored Typographic Hierarchy: In 
privacy_policy_card.dart
, we removed the hardcoded 12.s font sizes, allowing section titles to scale to 16.s (titleMedium) and bullet points to scale to 14.s (bodyMedium).
Standardized Footer Style: In 
privacy_policy_body.dart
, we replaced the raw TextStyle(fontSize: 9.s) with the themed Theme.of(context).textTheme.labelSmall style for the "Last Updated" text.
Improved Layout Alignment: Adjusted bullet point top padding from 14.h to 8.h in 
privacy_policy_card.dart
 so the bullet circle aligns cleanly with the first line of text.
Themed Colors: Changed the bullet point color from hardcoded Colors.black to the brand's AppColors.textDark token.

summary of the changes applied to standardize the typography and design:

1. Main Page & Lead Cards
Header Subtitle (
leads_header.dart
): Removed the custom subtitleWidget with a hardcoded 10.s size and replaced it with the subtitle property in ScreenHeader. This standardizes the subtitle styling to bodyMedium (12.s, FontWeight.w600).
Fallback Text (
leads_list.dart
): Replaced raw TextStyle on the "No leads found" fallback with the theme's textTheme.bodyMedium.
Lead Card Details (
lead_card_details.dart
):
Changed the Lead Name to use textTheme.titleSmall (which is 14.s) and copied bold weight.
Changed the Details Subtitle (source & status) to use the theme's textTheme.labelSmall (11.s) instead of a hardcoded 10.s style.
2. Filter & Sort Bottom Sheet
Sheet Title (
filter_sheet_body.dart
): Removed the redundant hardcoded fontSize: 16.s override on the titleMedium text theme style.
Clear Button (
filter_sheet_body.dart
): Replaced the hardcoded inline style with textTheme.labelMedium (12.s).
Section Heading (
filter_section.dart
): Replaced the hardcoded inline style with textTheme.labelSmall (11.s) styled with bold and custom letter-spacing.
Segmented Labels (
filter_sort_by.dart
): Replaced the raw text style with textTheme.bodySmall (12.s).
Source Chip Labels (
filter_source.dart
): Replaced the raw text style with textTheme.bodySmall (12.s).
Status Chip Labels (
filter_status.dart
): Standardized the font size from 10.s to 12.s using the theme's textTheme.bodySmall to resolve the visual mismatch with the sorting and source chip dimensions.


All 8 fixes are implemented. Here's a summary of what changed:

#	Fix	File(s) Changed
1	TextField label now inherits 12.s from bodySmall (was hardcoded 11.s)	custom_text_field_label.dart:26
2	Asterisk * now inherits same size as label from bodySmall (was 12.s → now matches)	custom_text_field_label.dart:36
3	Hint text inherits from input theme (was 13.s)	custom_text_field.dart:62
4	Button label inherits from button theme (was 14.s)	custom_button_helpers.dart:44
5	All three cards use CustomCard with consistent radius 16	add_lead_contact_fields.dart, add_lead_selection_fields.dart, add_lead_additional_fields.dart
6	Added isRequired: true to all 4 SelectionGroups	source_purpose_fields.dart:27,37, category_status_fields.dart:27,37
7	Removed trailing gapMd inside SelectionGroup	selection_group.dart:71
8	Header title weight w700 → w600 (matches titleMedium theme)	screen_header.dart:42

Typography fixes
File	Change
filter_section.dart	Removed trailing gapLg (fixes double spacing). Section headers now use labelSmall (11.s) instead of raw 10.s bold
filter_sheet_body.dart	"Filter & Sort" uses titleMedium directly (16.s w600). "Clear" uses labelSmall with primary color
filter_sort_by.dart	Options use labelMedium (12.s) instead of raw 12.s
filter_status.dart	Status chips use labelSmall (11.s) instead of raw 10.s
filter_source.dart	Source chips use labelMedium (12.s) instead of raw 12.s
leads_header.dart	Subtitle uses bodySmall (12.s) without font-size override
lead_card_details.dart	Name uses titleSmall (14.s w600), source·status uses labelSmall (11.s)
leads_search_bar.dart	Hint/input use bodyMedium (14.s) instead of raw 14.5.s
Color fix
File	Change
filter_source.dart	Unselected source chips: slate600 → textMuted for parity with all other unselected elements
Spacing fix
File	Change
filter_section.dart	Removed AppSpacing.gapLg (was causing doubled spacing between filter sections)
filter_chip_bar.dart	Raw 9.0.w/7.0.h → AppSpacing.md/AppSpacing.xs2. Raw sm+10.w → AppSpacing.ten
leads_list.dart	Raw 24.w/24.h → AppSpacing.xxl (loading shimmer padding now matches loaded list)
Title size fix
File	Change
screen_header.dart	"My Leads" title restored to headlineSmall (20.s) — removed the artificial 16.s override




All fixes are implemented and verified with zero analyzer errors. Here's a summary of what was changed across 12 files:

Files Modified
File	Changes
enquiry_details_header.dart	headlineMedium→titleLarge (lead name), bodyMedium→bodySmall×2 (email/phone), removed fontSize: 12.s overrides
screen_header.dart	headlineSmall→titleMedium (page title), removed fontSize: 16.s override
activity_tile.dart	bodySmall→labelSmall (activity titles) — more semantically correct for secondary timeline text
edit_enquiry_button.dart	Removed redundant fontSize: 12.s override (matches theme default)
fab_menu_item.dart	labelSmall→labelMedium — correct token for 12.s bold labels
info_item_tile.dart	Removed entire copyWith (all params matched theme defaults); removed unused import
notes_history_list.dart	Unified scaling: context.scaleFont()→.s; removed unused import
activities_tab_view.dart	Empty state: 14.s→16.s title, 11.s→14.s subtitle (now matches Notes tab); removed unused import
info_tab_view.dart	Added fontWeight: FontWeight.bold to "Change Status" button (consistent with other secondary buttons)
add_deal_form_fields.dart	Removed color: slate600 override (now inherits textMuted from theme)
add_deal_date_picker.dart	Same label color fix + removed unused import
add_deal_stage_selector.dart	Same label color fix
add_deal_stage_chip.dart	Removed unused import
tab_selector.dart	Removed unused import

All 6 files updated, build clean, tests passing. Here's a recap of the new typography hierarchy:

Element	Before	After	Theme Style
Header title	15.s (titleMedium+override)	14.s w600	titleSmall
Recipient info	12.s (bodySmall+override)	12.s	bodySmall
Section labels	13.s (bodySmall+override)	12.s w600	labelMedium
"Write your own"	12.s (bodySmall+override)	12.s w600	labelMedium
Template title	13.5.s (bodyLarge+override)	14.s w600	labelLarge
Template content	12.s (bodySmall+override)	12.s	bodySmall
Button label	15.s (bodyLarge+override)	14.s w600	labelLarge
Section gaps	21/13/17 varied	17 all	gapXl
Key wins: no more bespoke fontSize overrides, proper label styles (w600) for labels, consistent spacing rhythm, icon matched to text size.



Summary of Completed Work
TasksBloc DI Crash Fixed:

Relocated the TasksBloc provider from the local dashboard route context to the global provider list in 
app_bloc_providers.dart
. This guarantees that navigations or deep links directly to the TaskDetailsScreen sibling route will no longer crash due to missing dependency injection.
DIP Exception Decoupling & SoC String decoupling:

Introduced AuthDomainException inside the repository interface 
session_repository.dart
.
mapped all network and credential exceptions in the concrete SessionRepositoryImpl data source wrapper.
Cleared data source imports from 
login_bloc.dart
, satisfying the Dependency Inversion Principle.
Decoupled hardcoded user-facing error strings in the Change Password and New Password BLoCs by transitioning to type-safe enums (ChangePasswordFailure, NewPasswordFailure), leaving mapping logic exclusively to the UI layer.
Rebuild Scope Optimizations:

Restructured the widget layouts in 
task_details_screen.dart
 and 
dashboard_body.dart
 to lift static headers outside the BlocBuilder scopes, preventing redundant repaints.
Line-Limit Compliance (< 80 Lines):

Decoupled mock list arrays out of model and repository implementations to a unified lib/data/mocks/ directory.
Extracted sub-widgets and layout layers (such as AnalyticsFilterSheetBody, FontSettingsListBody, and EditEnquiryFormFieldsContainer) to clean up complex UI states.
Compacted properties/parameter declarations.
