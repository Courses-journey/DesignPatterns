import '../types/invoice.dart';
import 'shopping_carte.dart';

class InStoreShoppingCart extends ShoppingCart {
  @override
  Invoice applyDiscount(Invoice invoice) {
    return invoice;
  }
}
