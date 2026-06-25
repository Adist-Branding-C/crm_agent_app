feat: implement precise time-based follow-up categorization

Refactors follow-up categorization in the CRM application to be dynamically
computed on the fly by comparing the scheduled DateTime against the system clock,
replacing the previous static enum-based assignment.

Changes:
- lib/data/models/follow_up_models.dart:
  - Replaces `urgency` parameter in `FollowUp` with `scheduledTime` DateTime.
  - Implements dynamic `urgency` getter to categorize records into Overdue, Due Today, and Upcoming based on system date and time.
- lib/data/models/dashboard_models.dart:
  - Replaces static `isOverdue` flag on `FollowUpCall` with dynamic getter based on `scheduledTime`.
- lib/screens/view_call_log/widgets/add_follow_up_form.dart:
  - Updates submit flow to capture the selected date and time and pass it as `scheduledTime` to both `FollowUpCall` and `FollowUp` constructors.
- mock data files:
  - Updates mock records in `mock_follow_ups.dart` and `dashboard_repository_impl.dart` to define dynamic scheduled times relative to `DateTime.now()`.
- test/follow_up_logic_test.dart:
  - Introduces a new unit test suite validating the edge cases of time-based urgency categorization logic.

  feat(leads): add active visual indicator and clear option to filtering system

- Update Filter button on My Leads page to show a primary red background and white icon when any status or source filter is active.
- Add 'Clear' button to the Filter & Sort bottom sheet, visible only when a filter is applied.
- Tapping 'Clear' instantly resets the applied filters and updates the state.
- Add widget tests verifying both the active filter button visual states and the 'Clear' button functionality.

feat(tasks): implement consistent task details bottom sheet

- Create TaskDetailsBottomSheet and TaskDetailsActionBtn/TaskDetailsInfoRow widgets conforming to layout designs.
- Wire card/row tap gestures on dashboard and task screen to trigger bottom sheet details.
- Update mock tasks data to match user request references (e.g. Follow-up call, Send pricing sheet) along with realistic descriptions.
- Ensure all modified and new files strictly adhere to the under-80-lines file constraint.