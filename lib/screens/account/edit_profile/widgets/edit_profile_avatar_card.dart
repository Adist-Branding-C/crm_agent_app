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
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Center(
        child: Column(
          children: [
            UserAvatar(initials: initials, size: 40, fontSize: 18),
            AppSpacing.gapMd,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assignment_outlined,
                  size: 14.s,
                  color: AppColors.textMuted,
                ),
                SizedBox(width: AppSpacing.xs2),
                Text(
                  'Joined $joinedDate',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
