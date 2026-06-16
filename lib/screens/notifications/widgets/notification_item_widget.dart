import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/notifications/notifications_bloc.dart';
import '../../../bloc/notifications/notifications_models.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'notification_style_resolver.dart';

/// Renders a single notification card with type-based styling and indicators.
class NotificationItemWidget extends StatelessWidget {
  final NotificationItem item;
  const NotificationItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final style = item.type.style;
    return CustomCard(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.all(16),
      onTap: () {
        context.read<NotificationsBloc>().add(MarkAsRead(item.id));
        if (item.routePath != null) context.push(item.routePath!);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: style.bgColor, shape: BoxShape.circle),
            child: Icon(style.icon, color: style.iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textDark))),
                    if (!item.isRead)
                      Container(
                        margin: const EdgeInsets.only(left: 6),
                        width: 6, height: 6,
                        decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(item.subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                const SizedBox(height: 6),
                Text(item.time, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
