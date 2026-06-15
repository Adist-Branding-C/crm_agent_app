import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance/attendance_bloc.dart';
import '../../../theme.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF242C3D),
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          const FingerprintIcon(
            iconColor: Color(0xFF10B981),
            bgColor: Color(0xFF104A41),
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
