import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages settings state, including font size and style configurations,
/// and persists choices to device preferences.
class SettingsNotifier extends ChangeNotifier {
  static const String _fontSizeKey = 'settings_font_size';
  static const String _fontStyleKey = 'settings_font_style';

  String _fontSize = 'Default';
  String _fontStyle = 'Default';
  bool _isLoaded = false;

  String get fontSize => _fontSize;
  String get fontStyle => _fontStyle;
  bool get isLoaded => _isLoaded;

  /// Returns the corresponding base width for dynamic scaling.
  ///
  /// A larger base width scales down text size, while a smaller base width
  /// scales up text size.
  double get baseWidth {
    switch (_fontSize) {
      case 'Tiny':
        return 514.0;
      case 'Extra Small':
        return 450.0;
      case 'Small':
        return 400.0;
      case 'Large':
        return 313.0;
      case 'Extra Large':
        return 277.0;
      case 'Huge':
        return 240.0;
      case 'Default':
      case 'Medium':
      default:
        return 360.0;
    }
  }

  /// Loads persisted settings from preferences.
  Future<void> loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var size = prefs.getString(_fontSizeKey) ?? 'Default';
      if (size == 'Medium') size = 'Default';
      final style = prefs.getString(_fontStyleKey) ?? 'Default';
      if (_fontSize != size || _fontStyle != style) {
        _fontSize = size;
        _fontStyle = style;
        notifyListeners();
      }
    } catch (_) {
      // Keep fallbacks
    } finally {
      _isLoaded = true;
    }
  }

  /// Sets and persists the font size.
  Future<void> setFontSize(String size) async {
    if (_fontSize == size) return;
    _fontSize = size;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_fontSizeKey, size);
    } catch (_) {}
  }

  /// Sets and persists the font style.
  Future<void> setFontStyle(String style) async {
    if (_fontStyle == style) return;
    _fontStyle = style;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_fontStyleKey, style);
    } catch (_) {}
  }
}
