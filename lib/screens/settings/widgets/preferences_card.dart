import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

class PreferencesCard extends StatefulWidget {
  const PreferencesCard({super.key});

  @override
  State<PreferencesCard> createState() => _PreferencesCardState();
}

class _PreferencesCardState extends State<PreferencesCard> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppColors.textDark,
      fontSize: 15.s,
    );

    return CustomCard(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.notifications_none_rounded, size: 20.s, color: AppColors.textMuted),
              title: Text('Push Notifications', style: titleStyle),
              trailing: Switch.adaptive(
                value: _notificationsEnabled,
                onChanged: (val) {
                  setState(() {
                    _notificationsEnabled = val;
                  });
                },
              ),
            ),
            const Divider(height: 1, color: AppColors.borderLight),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined, size: 20.s, color: AppColors.textMuted),
              title: Text('Dark Mode', style: titleStyle),
              trailing: Text(
                'Light (Default)',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 12.s,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
