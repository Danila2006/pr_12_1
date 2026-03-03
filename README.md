# pr_12_1 - Unit-тести для Інтернет-магазину

Цей проект демонструє **unit-тести для інтернет-магазину** на Flutter/Dart.

- **Product**: тести `fromJson`, `toJson`, `copyWith`, `discountedPrice`, equality  
- **ShoppingCart**: тести `addItem`, `removeItem`, `total`, `applyPromoCode` (з моками)  
- **OrderValidator**: валідація адреси, кредитної картки та мінімальної суми замовлення  

---

## Встановлення

1. Переконайтесь, що встановлений Flutter SDK.
2. Встановіть залежності проекту:

```bash
flutter pub get

## Запуск тестів
Запуск усіх тестів:
flutter test

Запуск тесту конкретного файлу:
flutter test test/unit/models/product_test.dart

## Перевірка покриття коду
Щоб отримати coverage (покриття тестами):
flutter test --coverage
