import 'dart:math';
import 'package:flutter/material.dart';
import '../theme.dart';

class UserAvatar extends StatelessWidget {
  final String initials;

  /// Width/height diameter of the avatar.
  final double size;

  /// Background color of the circle (defaults to primaryColorLight).
  final Color? backgroundColor;

  /// Text color of initials (defaults to primaryColor).
  final Color? textColor;

  /// Custom font size (defaults to size * 0.35).
  final double? fontSize;

  static String initialsFromName(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.substring(0, min(2, name.length)).toUpperCase();
  }

  const UserAvatar({
    super.key,
    required this.initials,
    this.size = 40,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryColorLight,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: textColor ?? AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? (size * 0.35),
        ),
      ),
    );
  }
}
