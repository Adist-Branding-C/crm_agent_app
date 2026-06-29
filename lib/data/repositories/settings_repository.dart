/// Interface for settings storage.
abstract class SettingsRepository {
  /// Loads font settings.
  Future<Map<String, String>> loadSettings();

  /// Saves font size.
  Future<void> saveFontSize(String size);

  /// Saves font style.
  Future<void> saveFontStyle(String style);
}
