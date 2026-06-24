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
      margin: AppSpacing.cardMarginList,
      padding: AppSpacing.cardPadding,
      onTap: () {
        context.read<NotificationsBloc>().add(MarkAsRead(item.id));
        if (item.routePath != null) context.push(item.routePath!);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.ten),
            decoration: BoxDecoration(color: style.bgColor, shape: BoxShape.circle),
            child: Icon(style.icon, color: style.iconColor, size: 20),
          ),
          AppSpacing.gapWLg,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(item.title, style: Theme.of(context).textTheme.titleMedium)),
                    if (!item.isRead)
                      Container(
                        margin: EdgeInsets.only(left: AppSpacing.xs2),
                        width: 6, height: 6,
                        decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                      ),
                  ],
                ),
                AppSpacing.gapXs,
                Text(item.subtitle, style: Theme.of(context).textTheme.bodySmall),
                AppSpacing.gapXs,
                Text(item.time, style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
