import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Call button layout for the settings screen preview.
class LivePreviewCallButton extends StatelessWidget {
  /// Creates a constant [LivePreviewCallButton].
  const LivePreviewCallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.settingsRed,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 14.0.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () {},
        icon: Icon(Icons.phone_outlined, size: 16.s),
        label: Text(
          'Call lead',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.s),
        ),
      ),
    );
  }
}
