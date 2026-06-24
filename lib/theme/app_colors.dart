import 'package:flutter/material.dart';

/// Brand color tokens for the CRM Agent application.
class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primaryColor = Color(0xFFE53935);
  static const Color primaryColorLight = Color(0xFFFEE2E2);
  static const Color backgroundColor = Color(0xFFF7F8FA);
  static const Color textDark = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color errorBackground = Color(0xFFFEF2F2);

  // Semantic & Utility Colors
  static const Color success = Color(0xFF10B981);
  static const Color successBackground = Color(0xFFECFDF5);
  static const Color successIconBg = Color(0xFF104A41);
  static const Color successDark = Color(0xFF0D9488);
  static const Color successLight = Color(0xFFE6FFFA);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningBackground = Color(0xFFFFFBEB);
  static const Color warningText = Color(0xFFF97316);
  static const Color warningTextBackground = Color(0xFFFFF7ED);
  static const Color warningDark = Color(0xFFD97706);
  static const Color warningLight = Color(0xFFFEF3C7);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoBackground = Color(0xFFEFF6FF);
  static const Color infoDark = Color(0xFF2563EB);
  static const Color infoText = Color(0xFF0284C7);
  static const Color infoBackgroundLight = Color(0xFFE0F2FE);

  static const Color accent = Color(0xFF8B5CF6);
  static const Color accentBackground = Color(0xFFF5F3FF);

  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate50 = Color(0xFFF3F4F6);
  static const Color slate500 = Color(0xFF4B5563);
  static const Color slate600 = Color(0xFF475569);

  static const Color indigo = Color(0xFF6366F1);
  static const Color checkedInCardBg = Color(0xFF242C3D);
  static const Color errorBorder = Color(0xFFFCA5A5);
  static const Color slate900 = Color(0xFF0F172A);
  static const Color barrierColor = Color(0x10000000);

  // Pre-computed alpha variants (avoids withValues(alpha:) allocations)
  static const Color primaryAlpha30 = Color(0x4DE53935);
  static const Color slate900Alpha4 = Color(0x0A0F172A);
  static const Color blackAlpha5 = Color(0x0D000000);
  static const Color blackAlpha8 = Color(0x14000000);
  static const Color whiteAlpha60 = Color(0x99FFFFFF);
  static const Color greyAlpha8 = Color(0x149E9E9E);
  static const Color borderLightAlpha50 = Color(0x80E2E8F0);

  // Pre-computed 15% alpha for semantic colors
  static const Color successAlpha15 = Color(0x2610B981);
  static const Color accentAlpha15 = Color(0x268B5CF6);
  static const Color infoAlpha15 = Color(0x263B82F6);
  static const Color warningAlpha15 = Color(0x26F59E0B);

  // Common surface tokens & Dark theme surface colors
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color surfaceGrey = Color(0xFF9E9E9E);
  static const Color surfaceGrey200 = Color(0xFFEEEEEE);
  static const Color transparent = Color(0x00000000);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF2C2C2C);
  static const Color darkText = Color(0xFFE0E0E0);
  static const Color darkTextMuted = Color(0xFF9E9E9E);
  static const Color darkBorder = Color(0xFF383838);
}
