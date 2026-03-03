import 'package:pr_12_1/models/product.dart';
import 'package:pr_12_1/services/promo_code_repository.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class ShoppingCart {
  final PromoCodeRepository promoRepo;
  final Map<String, CartItem> items = {};
  int _promoDiscount = 0;

  ShoppingCart({required this.promoRepo});

  void addItem(Product product, int quantity) {
    if (quantity <= 0) return;
    if (items.containsKey(product.id)) {
      items[product.id]!.quantity += quantity;
    } else {
      items[product.id] = CartItem(product: product, quantity: quantity);
    }
  }

  void removeItem(String productId) {
    items.remove(productId);
  }

  double get total {
    final sum = items.values
        .map((item) => item.product.discountedPrice * item.quantity)
        .fold(0.0, (a, b) => a + b);
    return sum * (1 - _promoDiscount / 100);
  }

  Future<void> applyPromoCode(String code) async {
    final discount = await promoRepo.getDiscount(code);
    if (discount > 0) {
      _promoDiscount = discount;
    }
  }
}