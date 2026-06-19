import 'package:equatable/equatable.dart';

enum EnquiryActivityType { call, statusChange, note, task, system }

class EnquiryActivity extends Equatable {
  final String id;
  final String title;
  final String time;
  final EnquiryActivityType type;

  const EnquiryActivity({
    required this.id,
    required this.title,
    required this.time,
    required this.type,
  });

  @override
  List<Object?> get props => [id, title, time, type];
}
