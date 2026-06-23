import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/notifications/notifications_bloc.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/notifications_header.dart';
import 'widgets/notifications_list_body.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsBloc>().add(const LoadNotifications());
  }

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          NotificationsHeader(),
          Expanded(child: NotificationsListBody()),
        ],
      ),
    );
  }
}
