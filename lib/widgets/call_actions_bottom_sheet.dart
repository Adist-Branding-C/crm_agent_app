import 'package:flutter/material.dart';
import '../bloc/leads/leads_models.dart';
import 'call_actions_bottom_sheet_body.dart';

/// The bottom sheet dialog container displaying the Call Actions.
class CallActionsBottomSheet extends StatelessWidget {
  /// The target lead model.
  final Lead lead;

  /// Creates a constant [CallActionsBottomSheet].
  const CallActionsBottomSheet({super.key, required this.lead});

  /// Displays the modal bottom sheet with a smooth zoom transition.
  static void show(BuildContext context, {required Lead lead}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => CallActionsBottomSheet(lead: lead),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      builder: (context, val, child) => Transform.scale(
        scale: val,
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: ((val - 0.8) / 0.2).clamp(0.0, 1.0),
          child: child,
        ),
      ),
      child: CallActionsBottomSheetBody(lead: lead),
    );
  }
}
