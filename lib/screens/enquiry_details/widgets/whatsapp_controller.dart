import 'package:flutter/material.dart';
import 'whatsapp_template_model.dart';

/// Controller managing the input state for the WhatsApp message builder.
class WhatsAppController extends ChangeNotifier {
  /// Name of the recipient lead.
  final String recipientName;

  /// Controller for the message text field.
  final TextEditingController textController = TextEditingController();

  WhatsAppTemplateModel? _selectedTemplate;

  /// Creates a [WhatsAppController] with target lead's name.
  WhatsAppController({required this.recipientName}) {
    textController.addListener(_onTextChanged);
  }

  /// The currently selected template, if any.
  WhatsAppTemplateModel? get selectedTemplate => _selectedTemplate;

  /// Sets the selected template and populates the text field.
  void selectTemplate(WhatsAppTemplateModel? template) {
    if (_selectedTemplate == template) return;
    _selectedTemplate = template;
    if (template != null) {
      final interpolated = template.interpolate(recipientName);
      textController.text = interpolated;
    }
    notifyListeners();
  }

  /// Action to clear template selection when custom writing begins.
  void selectCustomWrite() {
    _selectedTemplate = null;
    textController.clear();
    notifyListeners();
  }

  void _onTextChanged() {
    // If the text no longer matches the selected template, clear selection
    if (_selectedTemplate != null) {
      final interpolated = _selectedTemplate!.interpolate(recipientName);
      if (textController.text != interpolated) {
        _selectedTemplate = null;
        notifyListeners();
      }
    } else {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    textController.removeListener(_onTextChanged);
    textController.dispose();
    super.dispose();
  }
}
