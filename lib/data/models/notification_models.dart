import 'package:equatable/equatable.dart';

enum NotificationType { lead, followUp, task, deal, leadStatus, mention }

class NotificationItem extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final NotificationType type;
  final bool isRead;
  final String? routePath;

  const NotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
    this.isRead = false,
    this.routePath,
  });

  NotificationItem copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? time,
    NotificationType? type,
    bool? isRead,
    String? routePath,
  }) {
    return NotificationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      time: time ?? this.time,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
      routePath: routePath ?? this.routePath,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    time,
    type,
    isRead,
    routePath,
  ];
}
