/// Extension for formatting currency values.
extension CurrencyFormatter on double {
  /// Formats the double value as an Indian Rupee (INR) amount.
  ///
  /// Values >= 100,000 are formatted as lakhs (e.g., ₹1.50L).
  /// Other values are formatted as thousands (e.g., ₹50K).
  String toRupeeFormat() {
    if (this >= 100000) {
      return '₹${(this / 100000).toStringAsFixed(2)}L';
    }
    return '₹${(this / 1000).toStringAsFixed(0)}K';
  }
}
