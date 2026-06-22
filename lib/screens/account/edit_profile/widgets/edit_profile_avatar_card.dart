import 'package:flutter/material.dart';
import '../../../../theme.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/user_avatar.dart';

/// Card component showing user initials avatar and join date.
class EditProfileAvatarCard extends StatelessWidget {
  final String initials;
  final String joinedDate;

  const EditProfileAvatarCard({
    super.key,
    required this.initials,
    required this.joinedDate,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Column(
          children: [
            UserAvatar(initials: initials, size: 90, fontSize: 32),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.assignment_outlined,
                  size: 14,
                  color: AppColors.textMuted,
                ),
                const SizedBox(width: 6),
                Text(
                  'Joined $joinedDate',
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
