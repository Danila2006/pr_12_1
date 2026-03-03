import 'package:flutter_test/flutter_test.dart';
import 'package:pr_12_1/models/product.dart';

void main() {
  group('Product Model', () {
    final productJson = {
      'id': 'p1',
      'name': 'Phone',
      'price': 1000,
      'discount': 10, // %
    };

    test('fromJson creates correct Product', () {
      final product = Product.fromJson(productJson);
      expect(product.id, 'p1');
      expect(product.name, 'Phone');
      expect(product.price, 1000);
      expect(product.discount, 10);
    });

    test('toJson returns correct map', () {
      final product = Product.fromJson(productJson);
      final json = product.toJson();
      expect(json, productJson);
    });

    test('discountedPrice calculates correctly', () {
      final product = Product.fromJson(productJson);
      final discounted = product.discountedPrice;
      expect(discounted, 900);
    });

    test('copyWith creates new Product with updated fields', () {
      final product = Product.fromJson(productJson);
      final newProduct = product.copyWith(price: 800);
      expect(newProduct.price, 800);
      expect(newProduct.name, product.name);
    });

    test('equality works correctly', () {
      final product1 = Product.fromJson(productJson);
      final product2 = Product.fromJson(productJson);
      expect(product1, product2);
    });
  });
}