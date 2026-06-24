import 'package:flutter/material.dart';
import '../../../theme.dart';

class CallActionConfig {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color iconBgColor;
  final VoidCallback onTap;

  const CallActionConfig({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.iconBgColor,
    required this.onTap,
  });

  static const _success = AppColors.success;
  static const _successBg = AppColors.successBackground;
  static const _info = AppColors.info;
  static const _infoBg = AppColors.infoBackground;
  static const _neutral = AppColors.slate600;
  static const _neutralBg = AppColors.slate100;

  factory CallActionConfig.callNow({
    required String phone,
    required VoidCallback onTap,
  }) => CallActionConfig(
    icon: Icons.call_rounded,
    title: 'Call now',
    subtitle: phone,
    iconColor: _success,
    iconBgColor: _successBg,
    onTap: onTap,
  );

  factory CallActionConfig.whatsApp({required VoidCallback onTap}) =>
      CallActionConfig(
        icon: Icons.chat_bubble_outline_rounded,
        title: 'WhatsApp',
        subtitle: 'Choose template',
        iconColor: _success,
        iconBgColor: _successBg,
        onTap: onTap,
      );

  factory CallActionConfig.sendSms({
    required String phone,
    required VoidCallback onTap,
  }) => CallActionConfig(
    icon: Icons.sms_outlined,
    title: 'Send SMS',
    subtitle: phone,
    iconColor: _info,
    iconBgColor: _infoBg,
    onTap: onTap,
  );

  factory CallActionConfig.copyNumber({
    required String phone,
    required VoidCallback onTap,
  }) => CallActionConfig(
    icon: Icons.file_copy_outlined,
    title: 'Copy number',
    subtitle: phone,
    iconColor: _neutral,
    iconBgColor: _neutralBg,
    onTap: onTap,
  );
}
