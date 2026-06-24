import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_context_theme.dart';
import '../../../theme/app_spacing.dart';
import '../../../utils/context_text_extension.dart';

/// Password complexity indicator displaying a 3-segment progress indicator.
class PasswordStrengthMeter extends StatelessWidget {
  final String password;

  const PasswordStrengthMeter({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) return const SizedBox.shrink();
    final strength = _calculateStrength();

    final activeColor = strength == 1
        ? context.error
        : (strength == 2 ? context.warning : context.success);

    final textLabel = strength == 1
        ? 'Weak'
        : (strength == 2 ? 'Medium' : 'Strong');

    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.sm),
      child: Row(
        children: [
          ...List.generate(3, (index) {
            final active = strength > index;
            return Expanded(
              child: Container(
                height: 4,
                margin: EdgeInsets.only(
                  right: index < 2 ? 6.0 : 0.0,
                ),
                decoration: BoxDecoration(
                  color: active ? activeColor : AppColors.slate300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
          AppSpacing.gapWMd,
          Text(
            textLabel,
            style: TextStyle(
              fontSize: context.scaleFont(12),
              fontWeight: FontWeight.bold,
              color: activeColor,
            ),
          ),
        ],
      ),
    );
  }

  int _calculateStrength() {
    if (password.length < 6) return 1;
    if (password.length < 8) return 2;
    return 3;
  }
}
