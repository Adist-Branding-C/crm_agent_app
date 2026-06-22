import 'package:equatable/equatable.dart';

class WhatsAppTemplateModel extends Equatable {
  final String id;
  final String title;
  final String contentTemplate;

  const WhatsAppTemplateModel({
    required this.id,
    required this.title,
    required this.contentTemplate,
  });

  String interpolate(String recipientName) {
    return contentTemplate.replaceAll('{name}', recipientName);
  }

  @override
  List<Object?> get props => [id, title, contentTemplate];
}
