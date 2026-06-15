import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../theme.dart';

/// Renders the Activities tab showing a vertical history timeline.
class ActivitiesTabView extends StatelessWidget {
  /// The list of activities to show.
  final List<EnquiryActivity> activities;

  /// Creates a constant [ActivitiesTabView].
  const ActivitiesTabView({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 80),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final act = activities[index];
        final isLast = index == activities.length - 1;
        return _buildActivityTile(act, isLast);
      },
    );
  }

  Widget _buildActivityTile(EnquiryActivity act, bool isLast) {
    final colors = _getColors(act.type);
    final icon = _getIcon(act.type);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 36,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (!isLast)
                  Positioned(
                    top: 16,
                    bottom: 0,
                    child: Container(width: 1.5, color: const Color(0xFFE2E8F0)),
                  ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(color: colors.bgColor, shape: BoxShape.circle),
                  child: Icon(icon, color: colors.iconColor, size: 16),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    act.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textDark),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    act.time,
                    style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Config _getColors(EnquiryActivityType type) {
    switch (type) {
      case EnquiryActivityType.call:
        return const _Config(Color(0xFF10B981), Color(0xFFECFDF5));
      case EnquiryActivityType.statusChange:
        return const _Config(Color(0xFF8B5CF6), Color(0xFFF5F3FF));
      case EnquiryActivityType.note:
        return const _Config(Color(0xFF3B82F6), Color(0xFFEFF6FF));
      case EnquiryActivityType.task:
        return const _Config(Color(0xFFF59E0B), Color(0xFFFFFBEB));
      case EnquiryActivityType.system:
        return const _Config(Color(0xFFEF4444), Color(0xFFFEF2F2));
    }
  }

  IconData _getIcon(EnquiryActivityType type) {
    switch (type) {
      case EnquiryActivityType.call: return Icons.phone;
      case EnquiryActivityType.statusChange: return Icons.sync;
      case EnquiryActivityType.note: return Icons.description;
      case EnquiryActivityType.task: return Icons.check_box;
      case EnquiryActivityType.system: return Icons.person;
    }
  }
}

class _Config {
  final Color iconColor;
  final Color bgColor;
  const _Config(this.iconColor, this.bgColor);
}
