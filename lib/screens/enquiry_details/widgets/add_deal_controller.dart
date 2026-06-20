import 'package:flutter/material.dart';
import '../../../bloc/deals/deals_models.dart';
import '../../../bloc/leads/leads_models.dart';

/// Controller managing the input state for the Add Deal form.
class AddDealController extends ChangeNotifier {
  final Lead lead;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DealStage selectedStage = DealStage.newStage;
  DateTime? expectedClose;

  AddDealController({required this.lead}) {
    final firstName = lead.name.split(' ').first;
    nameController.text = '${lead.source.label} — $firstName';

    final now = DateTime.now();
    expectedClose = DateTime(now.year, now.month, now.day, 16, 0);

    nameController.addListener(notifyListeners);
    amountController.addListener(notifyListeners);
  }

  void selectStage(DealStage stage) {
    if (selectedStage == stage) return;
    selectedStage = stage;
    notifyListeners();
  }

  void selectExpectedClose(DateTime dateTime) {
    expectedClose = dateTime;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  void setError(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool get isValid {
    final name = nameController.text.trim();
    final amountText = amountController.text.trim();
    if (name.isEmpty || amountText.isEmpty) return false;
    final amount = double.tryParse(amountText);
    if (amount == null || amount <= 0) return false;
    if (expectedClose == null) return false;
    return true;
  }

  @override
  void dispose() {
    nameController.removeListener(notifyListeners);
    amountController.removeListener(notifyListeners);
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
