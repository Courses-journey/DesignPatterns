import 'carts/in_store_shopping_carte.dart';
import 'carts/online_shopping_carte.dart';
import 'carts/shopping_carte.dart';
import 'dummy/customers.dart';

import 'dart:io';

import 'dummy/items.dart';
import 'payment_lib/payment_processor.dart';
import 'payments/paypal_payment_processor.dart';
import 'payments/visa_payment_processor.dart';
import 'types/customer.dart';
import 'types/item.dart';

int main() {
  while (true) {
    String customerListString = customersList.fold(
      "",
      (previousValue, e) => previousValue + "${e.id}. ${e.name}\n",
    );
    stdout.writeln("Customer List:\n$customerListString");

    String itemsListString = itemsList.fold(
      "",
      (previousValue, e) =>
          previousValue + "${e.itemId}. ${e.name} ${e.unitPrice}\n",
    );
    stdout.writeln("Items List:\n$itemsListString");

    stdout.write("Enter Customer Id: ");
    int customerId = int.parse(stdin.readLineSync() ?? "0");

    stdout.write("Select Shopping Cart type (Online | InStore): ");
    String shoppingCartString = stdin.readLineSync() ?? "Online";
    ShoppingCart shoppingCart = shoppingCartString == "Online"
        ? OnlineShoppingCart()
        : InStoreShoppingCart();

    while (true) {
      stdout.write("\nEnter Item ID (0 to checkout):  ");
      int itemId = int.parse(stdin.readLineSync() ?? "0");
      if (itemId == 0) break;

      stdout.write("Enter Item Quantity:  ");
      int quantity = int.parse(stdin.readLineSync() ?? "0");

      Item item = itemsList.firstWhere((element) => element.itemId == itemId);
      shoppingCart.addToCart(itemId, quantity, item.unitPrice);
    }

    /// Get selected Customer
    final Customer customer = customersList.firstWhere(
      (element) => element.id == customerId,
    );

    stdout.write("Select Payment Method (Visa | Paypal): ");
    String paymentMethodString = stdin.readLineSync() ?? "Visa";
    PaymentProcessor paymentProcessor = paymentMethodString == "Visa"
        ? VisaPaymentProcessor()
        : PaypalPaymentProcessor();

    shoppingCart.checkOut(customer, paymentProcessor);

    stdout.write("\n\nEnter 0 to exit or 1 to continue: ");
    int input = int.parse(stdin.readLineSync() ?? "0");
    if (input == 0) break; //Break loop
    stdout.write("\n====================================\n");
  }

  return 0;
}
