import 'package:flutter/material.dart';
import '../../../theme.dart';

class MenuDivider extends StatelessWidget {
  const MenuDivider({super.key});

  @override
  Widget build(BuildContext context) => const Divider(
    height: 1, indent: 16, endIndent: 16,
    color: AppColors.borderLight,
  );
}
