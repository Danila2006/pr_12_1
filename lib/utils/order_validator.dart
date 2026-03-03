class OrderValidator {
  bool validateAddress({required String street, required String city, required String zipCode}) {
    if (street.isEmpty || city.isEmpty || zipCode.length != 5 || int.tryParse(zipCode) == null) {
      return false;
    }
    return true;
  }

  bool validateCard({required String number, required int expiryMonth, required int expiryYear}) {
    final now = DateTime.now();
    if (number.length != 16 || int.tryParse(number) == null) return false;
    if (expiryYear < now.year || (expiryYear == now.year && expiryMonth < now.month)) return false;
    if (expiryMonth < 1 || expiryMonth > 12) return false;
    return true;
  }

  bool validateMinimumOrder(double amount) => amount >= 50;
}