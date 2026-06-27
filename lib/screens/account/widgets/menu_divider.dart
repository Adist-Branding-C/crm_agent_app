import 'package:flutter/material.dart';
import '../../../theme.dart';

class MenuDivider extends StatelessWidget {
  const MenuDivider({super.key});

  @override
  Widget build(BuildContext context) => Divider(
    height: 1.h,
    indent: 16.w,
    endIndent: 16.w,
    color: AppColors.borderLight,
  );
}
