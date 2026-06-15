import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance/attendance_bloc.dart';
import '../../../theme.dart';
import 'checked_out_info.dart';
import 'fingerprint_icon.dart';

/// Inside content for Checked Out (Start your day) card.
class CheckedOutCardBody extends StatelessWidget {
  /// Creates a constant [CheckedOutCardBody].
  const CheckedOutCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          const FingerprintIcon(
            iconColor: AppColors.primaryColor,
            bgColor: Color(0xFFFEF2F2),
          ),
          const SizedBox(width: 12),
          const Expanded(child: CheckedOutInfo()),
          const SizedBox(width: 8),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        elevation: 0,
      ),
      onPressed: () => context.read<AttendanceBloc>().add(const CheckIn()),
      child: const Text(
        'Check in',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}
