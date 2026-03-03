class Product {
  final String id;
  final String name;
  final double price;
  final double discount;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        discount: (json['discount'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'discount': discount,
      };

  double get discountedPrice => price * (1 - discount / 100);

  Product copyWith({String? id, String? name, double? price, double? discount}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      discount: discount ?? this.discount,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          id == other.id &&
          name == other.name &&
          price == other.price &&
          discount == other.discount;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ price.hashCode ^ discount.hashCode;
}