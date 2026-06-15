import 'package:crm_agent_app/utils/currency_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyFormatter Extension Tests', () {
    test('formats amounts >= 100,000 as Lakhs (L)', () {
      expect(100000.0.toRupeeFormat(), '₹1.00L');
      expect(150000.0.toRupeeFormat(), '₹1.50L');
      expect(275800.0.toRupeeFormat(), '₹2.76L');
      expect(1000000.0.toRupeeFormat(), '₹10.00L');
    });

    test('formats amounts < 100,000 as Thousands (K)', () {
      expect(0.0.toRupeeFormat(), '₹0K');
      expect(999.0.toRupeeFormat(), '₹1K'); // 999 / 1000 = 0.999 -> rounded to 1
      expect(1000.0.toRupeeFormat(), '₹1K');
      expect(5000.0.toRupeeFormat(), '₹5K');
      expect(99999.0.toRupeeFormat(), '₹100K'); // 99999 / 1000 = 99.999 -> rounded to 100
    });
  });
}
