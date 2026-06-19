export '../../data/models/activity_models.dart';

import 'package:equatable/equatable.dart';

class EnquiryNote extends Equatable {
  final String id;
  final String author;
  final String content;
  final String time;

  const EnquiryNote({
    required this.id,
    required this.author,
    required this.content,
    required this.time,
  });

  @override
  List<Object?> get props => [id, author, content, time];
}
