import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance/attendance_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'checked_in_info.dart';
import 'fingerprint_icon.dart';

/// Inside content for Checked In card.
class CheckedInCardBody extends StatelessWidget {
  final String? checkInTime;
  final String location;

  /// Creates a constant [CheckedInCardBody].
  const CheckedInCardBody({
    super.key,
    this.checkInTime,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: AppColors.checkedInCardBg,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Row(
        children: [
          const FingerprintIcon(
            iconColor: AppColors.success,
            bgColor: AppColors.successIconBg,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: CheckedInInfo(location: location, checkInTime: checkInTime),
          ),
          const SizedBox(width: 8),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 1.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: () => context.read<AttendanceBloc>().add(const CheckOut()),
      child: const Text(
        'Check out',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}
