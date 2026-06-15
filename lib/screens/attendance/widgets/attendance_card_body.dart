import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance/attendance_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'fingerprint_icon.dart';

/// Generic attendance card body for both check-in and check-out states.
class AttendanceCardBody extends StatelessWidget {
  final bool isCheckedIn;
  final String location;
  final String? checkInTime;

  /// Creates a constant [AttendanceCardBody].
  const AttendanceCardBody({
    super.key,
    required this.isCheckedIn,
    required this.location,
    this.checkInTime,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: isCheckedIn ? const Color(0xFF242C3D) : null,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Row(
        children: [
          FingerprintIcon(
            iconColor: isCheckedIn ? const Color(0xFF10B981) : AppColors.primaryColor,
            bgColor: isCheckedIn ? const Color(0xFF104A41) : const Color(0xFFFEF2F2),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCheckedIn ? "You're checked in" : 'Start your day',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isCheckedIn ? Colors.white : AppColors.textDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: isCheckedIn ? const Color(0xFF94A3B8) : AppColors.textMuted,
                      size: 13,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        isCheckedIn
                            ? '$location · since $checkInTime'
                            : 'Punch in to log attendance',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isCheckedIn ? const Color(0xFF94A3B8) : AppColors.textMuted,
                              fontSize: 11,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildAction(context),
        ],
      ),
    );
  }

  Widget _buildAction(BuildContext context) {
    return isCheckedIn
        ? OutlinedButton(
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
          )
        : ElevatedButton(
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
