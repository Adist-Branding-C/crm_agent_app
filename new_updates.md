feat: implement Add Deal flow with state-driven navigation to Deals page

- Add DealAdded state (success/error) to DealsBloc for deterministic
  post-submission feedback
- Register DealsBloc globally in app_bloc_providers (session-scoped)
- Add addDeal() to DealsRepository; update impl with mutable list
- Wire Add Deal button in FAB menu to open bottom sheet form
- Move submission logic into AddDealBottomSheetBody (StatefulWidget):
  validate, dispatch AddDeal, await DealAdded stream result
- Add loading/error state to AddDealController; show inline error
  and spinner on submit button
- On success: pop bottom sheet → pushNamed(AppRoutes.deals)
- On failure: show error message, re-enable form for retry
- Remove local DealsBloc provider from DealsScreen (now global)
- Capture GoRouter before await to avoid context invalidation

Feat implimentd whatsaap bottom sheet and Edit lead page

