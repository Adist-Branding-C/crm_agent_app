import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Selection indicator icon showing check state inside settings cards.
class TypefaceCheckIndicator extends StatelessWidget {
  /// Whether the option is currently selected.
  final bool isSelected;

  /// Creates a constant [TypefaceCheckIndicator].
  const TypefaceCheckIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 22.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.settingsRed : Colors.transparent,
        border: Border.all(
          color: isSelected ? AppColors.settingsRed : AppColors.borderLight,
          width: 1.5.w,
        ),
      ),
      child: isSelected
          ? Icon(Icons.check, size: 14.s, color: Colors.white)
          : null,
    );
  }
}
