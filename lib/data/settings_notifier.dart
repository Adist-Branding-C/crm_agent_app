import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'repositories/settings_repository.dart';

/// Manages settings state, including font size and style configurations,
/// and delegates choice persistence to a [SettingsRepository].
class SettingsNotifier extends ChangeNotifier {
  final SettingsRepository _repository;

  String _fontSize = 'Default';
  String _fontStyle = 'Default';
  bool _isLoaded = false;
  bool _hasSavedSettings = false;

  SettingsNotifier(this._repository);

  String get fontSize => _fontSize;
  String get fontStyle => _fontStyle;
  bool get isLoaded => _isLoaded;
  bool get hasSavedSettings => _hasSavedSettings;

  double get baseWidth {
    switch (_fontSize) {
      case 'Tiny': return 514.0;
      case 'Extra Small': return 450.0;
      case 'Small': return 400.0;
      case 'Large': return 313.0;
      case 'Extra Large': return 277.0;
      case 'Huge': return 240.0;
      default: return 360.0;
    }
  }

  /// Loads persisted settings from repository.
  Future<void> loadSettings() async {
    try {
      final data = await _repository.loadSettings();
      _fontSize = data['fontSize'] ?? 'Default';
      if (_fontSize == 'Medium') _fontSize = 'Default';
      _fontStyle = data['fontStyle'] ?? 'Default';
      _hasSavedSettings = _fontSize != 'Default' || _fontStyle != 'Default';
      notifyListeners();
    } catch (e, s) {
      developer.log('Failed to load settings', error: e, stackTrace: s, name: 'SettingsNotifier');
    } finally {
      _isLoaded = true;
    }
  }

  /// Sets and persists the font size.
  Future<void> setFontSize(String size) async {
    _fontSize = size;
    _hasSavedSettings = true;
    notifyListeners();
    try {
      await _repository.saveFontSize(size);
    } catch (e, s) {
      developer.log('Failed to save font size', error: e, stackTrace: s, name: 'SettingsNotifier');
    }
  }

  /// Sets and persists the font style.
  Future<void> setFontStyle(String style) async {
    _fontStyle = style;
    _hasSavedSettings = true;
    notifyListeners();
    try {
      await _repository.saveFontStyle(style);
    } catch (e, s) {
      developer.log('Failed to save font style', error: e, stackTrace: s, name: 'SettingsNotifier');
    }
  }
}
