import 'package:equatable/equatable.dart';

/// Represents a predefined message template.
class WhatsAppTemplateModel extends Equatable {
  /// Unique identifier of the template.
  final String id;

  /// Title of the template displayed to user.
  final String title;

  /// The message content template, supporting '{name}' placeholder.
  final String contentTemplate;

  /// Creates a constant [WhatsAppTemplateModel].
  const WhatsAppTemplateModel({
    required this.id,
    required this.title,
    required this.contentTemplate,
  });

  /// Interpolates the template content with the recipient's name.
  String interpolate(String recipientName) {
    return contentTemplate.replaceAll('{name}', recipientName);
  }

  @override
  List<Object?> get props => [id, title, contentTemplate];

  /// The list of default predefined templates.
  static List<WhatsAppTemplateModel> getDefaultTemplates() {
    return const [
      WhatsAppTemplateModel(
        id: 'welcome',
        title: 'Welcome / Intro',
        contentTemplate: "Hi {name}, thanks for your interest in our programs! I'm Arjun from the admissions team. When would be a good time to connect?",
      ),
      WhatsAppTemplateModel(
        id: 'follow_up',
        title: 'Follow-up reminder',
        contentTemplate: "Hi {name}, just following up on our conversation. Do you have any questions about the course or fees? Happy to help!",
      ),
      WhatsAppTemplateModel(
        id: 'demo_invite',
        title: 'Demo invite',
        contentTemplate: "Hi {name}, we'd love to show you a live demo of the program. Let me know which slot works for you.",
      ),
      WhatsAppTemplateModel(
        id: 'fee_structure',
        title: 'Fee Structure',
        contentTemplate: "Hi {name}, sharing our latest fee structure and the ongoing early-bird offer. Let me know if you'd like to proceed!",
      ),
      WhatsAppTemplateModel(
        id: 'document_request',
        title: 'Document request',
        contentTemplate: "Hi {name}, to confirm your admission please share your ID proof and previous marksheet. You can send them right here.",
      ),
      WhatsAppTemplateModel(
        id: 'thank_you',
        title: 'Thank you / Welcome aboard',
        contentTemplate: "Welcome aboard, {name}! 🎉 Your admission is confirmed. Our team will reach out with the next steps shortly.",
      ),
      WhatsAppTemplateModel(
        id: 'antigravity_context',
        title: 'Antigravity CRM Follow-up',
        contentTemplate: "Hi {name}, I am following up on your inquiry via our Antigravity CRM portal. Let me know if you have any questions!",
      ),
    ];
  }
}
