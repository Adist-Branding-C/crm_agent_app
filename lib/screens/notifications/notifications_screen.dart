import 'package:flutter/material.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/notifications_header.dart';
import 'widgets/notifications_list_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: const Column(
        children: [
          NotificationsHeader(),
          Expanded(child: NotificationsListBody()),
        ],
      ),
    );
  }
}
