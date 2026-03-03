import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pr_12_1/models/product.dart';
import 'package:pr_12_1/services/shopping_cart.dart';
import 'package:pr_12_1/services/promo_code_repository.dart';

class MockPromoCodeRepository extends Mock implements PromoCodeRepository {}

void main() {
  group('ShoppingCart', () {
    late ShoppingCart cart;
    late MockPromoCodeRepository mockRepo;
    final product = Product(id: 'p1', name: 'Phone', price: 1000, discount: 10);

    setUp(() {
      mockRepo = MockPromoCodeRepository();
      cart = ShoppingCart(promoRepo: mockRepo);
    });

    test('addItem adds product to cart', () {
      cart.addItem(product, 2);
      expect(cart.items.length, 1);
      expect(cart.items[product.id]?.quantity, 2);
    });

    test('removeItem removes product from cart', () {
      cart.addItem(product, 2);
      cart.removeItem(product.id);
      expect(cart.items.isEmpty, true);
    });

    test('total calculates correctly with discount', () {
      cart.addItem(product, 2);
      final total = cart.total;
      expect(total, 1800);
    });

    test('applyPromoCode applies discount', () async {
      when(() => mockRepo.getDiscount('PROMO10')).thenAnswer((_) async => 10);
      cart.addItem(product, 1);
      await cart.applyPromoCode('PROMO10');
      expect(cart.total, 810);
      verify(() => mockRepo.getDiscount('PROMO10')).called(1);
    });

    test('applyPromoCode with invalid code does nothing', () async {
      when(() => mockRepo.getDiscount('INVALID')).thenAnswer((_) async => 0);
      cart.addItem(product, 1);
      await cart.applyPromoCode('INVALID');
      expect(cart.total, 900);
    });

    test('empty cart total is zero', () {
      final total = cart.total;
      expect(total, 0);
    });

    test('adding 0 quantity does not add item', () {
      cart.addItem(product, 0);
      expect(cart.items.isEmpty, true);
    });
  });
}