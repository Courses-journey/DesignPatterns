import '../types/invoice.dart';
import 'shopping_carte.dart';

class OnlineShoppingCart extends ShoppingCart {
  @override
  Invoice applyDiscount(Invoice invoice) {
    return invoice.copyWith(
      discountPercentage: invoice.totalPrice > 10000 ? 0.05 : 0,
    );
  }
}
