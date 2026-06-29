import 'package:shared_preferences/shared_preferences.dart';
import 'settings_repository.dart';

/// Implementation of [SettingsRepository] using [SharedPreferences].
class SettingsRepositoryImpl implements SettingsRepository {
  static const String _fontSizeKey = 'settings_font_size';
  static const String _fontStyleKey = 'settings_font_style';

  @override
  Future<Map<String, String>> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'fontSize': prefs.getString(_fontSizeKey) ?? 'Default',
      'fontStyle': prefs.getString(_fontStyleKey) ?? 'Default',
    };
  }

  @override
  Future<void> saveFontSize(String size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fontSizeKey, size);
  }

  @override
  Future<void> saveFontStyle(String style) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fontStyleKey, style);
  }
}
