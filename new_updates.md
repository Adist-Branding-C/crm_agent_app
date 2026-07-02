### Bug Fixes

- **Typography double-scaling**: Fixed `UserAvatar` instances passing SFS-scaled sizes (`.r`/`.s`) instead of raw doubles, eliminating double-scaling layout bug
- **Color inconsistency**: Updated `DealStageBadge` to dynamically resolve colors from `stage.color` instead of hardcoding primary light purple for all stages
- **Layout misalignment**:
  - Reset and Apply buttons in Analytics filter actions now share a uniform `55.h` height
  - Cancel button height standardized to `65.h` across Edit Profile and Change Password screens
  - Bullet point alignment adjusted in Privacy Policy card (top padding `14.h` → `8.h`)
  - Removed double horizontal padding on `PageScaffold` (Change Password screen)
  - Fixed doubled spacing between filter sections by removing trailing `gapLg`
- **Color parity**: Unselected source chips now use `textMuted` instead of `slate600` to match all other unselected elements
- **Header spacing**: Reduced excessive blank space on Change Password screen (ScreenHeader top padding `90.h` → `25.h`)
- **CustomCard radius**: Standardized card radius to `16` across all Add Lead card fields

### Improvements

- **Typography standardization** — Replaced hardcoded font sizes and raw `TextStyle` wrappers with centralized theme tokens (`titleSmall`, `labelMedium`, `bodySmall`, etc.) across **all screens** including:
  - Deals, Dashboard, Campaigns, Analytics
  - Daily Activity, Profile, Account, Attendance History
  - Change Password, Privacy Policy, Call Reports
  - Leads, Enquiries, Email Templates, Add Lead forms
- **Code cleanup**: Removed unused imports across 20+ widget files; deleted dead `menu_item_widget.dart` and `call_report_header.dart` files
- **Code de-duplication**: Refactored `HistoryStatusBadge` to reuse `AttendanceStatusTheme.resolve(status)` instead of redundant conditional checks
- **Icon scaling**: Applied `.s` scaling suffix to filter sheet icons and calendar/status icons for consistent responsive sizing
- **Widget extraction**: Extracted `FilterButton`, `TabButton`, and `CustomDateRangePicker` to standalone files to comply with 80-line file limit
- **Visual hierarchy**: Reduced secondary metadata in `ActivityMetadataRow` from `14.s` to `12.s` (`bodySmall`) for proper title-to-metadata contrast
- **Spacing standardization**: Replaced magic numbers with `AppSpacing` tokens (`.md`, `.xs2`, `.xl`, `.cardPaddingCompact`) and consistent section gaps (`gapXl` / `17`)
- **Pill-style badges**: Redesigned `CampaignStatusBadge` as a styled pill container matching `DealStageBadge`, with dynamic `campaign.themeColor` and "Done" label for completed campaigns
- **Fallback/empty states**: Standardized empty state text and "No leads found" fallback to use theme `bodyMedium` across leads and activity screens
- **Button consistency**: Aligned Cancel button (`OutlinedButton`) border radius to `8.r`, typography to `labelLarge`, and disabled state during form submission