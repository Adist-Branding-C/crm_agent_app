feat(my_activity): match UI to design specs and fix file-length violations

- Extract ActivityStatusBadge into its own widget file (activity_status_badge.dart)
- Slim activity_title_row.dart from 83 → 31 lines
- Condense my_activity_handlers.dart from 85 → 70 lines
- Replace SelectionGroup with dark-fill horizontal chip row for type filters
- Remove 48px left indent on date headers to sit flush-left

All files now comply with the <80 lines constraint.
flutter analyze: no issues found.

feat : call report implimented
