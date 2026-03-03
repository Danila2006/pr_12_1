import 'package:flutter_test/flutter_test.dart';
import 'package:pr_12_1/utils/order_validator.dart';

void main() {
  group('OrderValidator', () {
    final validator = OrderValidator();

    test('valid address passes validation', () {
      final result = validator.validateAddress(
        street: 'Main St',
        city: 'Kyiv',
        zipCode: '01001',
      );
      expect(result, true);
    });

    test('invalid address fails validation', () {
      final result = validator.validateAddress(
        street: '',
        city: '',
        zipCode: 'abc',
      );
      expect(result, false);
    });

    test('valid credit card passes validation', () {
      final result = validator.validateCard(
        number: '1234567812345678',
        expiryMonth: 12,
        expiryYear: 2030,
      );
      expect(result, true);
    });

    test('invalid credit card fails validation', () {
      final result = validator.validateCard(
        number: '123',
        expiryMonth: 1,
        expiryYear: 2020,
      );
      expect(result, false);
    });

    test('order below minimum sum fails', () {
      final result = validator.validateMinimumOrder(49);
      expect(result, false);
    });

    test('order above minimum sum passes', () {
      final result = validator.validateMinimumOrder(50);
      expect(result, true);
    });
  });
}