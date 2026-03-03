# pr_12_1 – Unit-тести для Інтернет-магазину

Цей проект демонструє **unit-тести для інтернет-магазину** на Flutter/Dart.

## Особливості тестування

- **Product**
  - `fromJson` / `toJson`
  - `copyWith`
  - `discountedPrice`
  - Перевірка рівності (`equality`)
  
- **ShoppingCart**
  - `addItem` / `removeItem`
  - Розрахунок `total`
  - `applyPromoCode` (з використанням моків)
  
- **OrderValidator**
  - Валідація адреси
  - Перевірка кредитної картки
  - Перевірка мінімальної суми замовлення

## Встановлення

1. Переконайтесь, що у вас встановлений **Flutter SDK**.  
2. Встановіть залежності проекту:

```bash
flutter pub get
```bash
fdfd
