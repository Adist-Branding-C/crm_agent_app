/// Extension for formatting currency values.
extension CurrencyFormatter on double {
  /// Formats the double value as a currency amount.
  ///
  /// Values >= 100000 are formatted as lakhs (e.g., ₹1.50L).
  /// Other values are formatted as thousands (e.g., ₹50K).
  String toCurrencyFormat({String symbol = '₹', bool useIndianNotation = true}) {
    if (useIndianNotation && this >= 100000) {
      final lakhs = this / 100000;
      if (lakhs == lakhs.toInt()) {
        return '$symbol${lakhs.toInt()}L';
      }
      return '$symbol${(this / 100000).toStringAsFixed(2)}L';
    }
    return '$symbol${(this / 1000).toStringAsFixed(0)}K';
  }

  /// Formats as Indian Rupee (INR) — default notation for this app.
  String toRupeeFormat() => toCurrencyFormat();
}
