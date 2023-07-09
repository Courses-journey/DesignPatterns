import 'dart:io';

import 'console/print_color.dart';
import 'dummy/products.dart';
import 'types/order.dart';
import 'types/product.dart';

int main() {
  while (true) {
    Order order = Order();

    while (true) {
      String itemsListString = productList.fold(
        "",
        (previousValue, e) =>
            previousValue + "\t${e.id}. ${e.name} ${e.unitPrice}\n",
      );
      stdout.writeln("Product List:\n$itemsListString");
      stdout.write("Enter Item ID (0 to checkout):  ");

      int itemId = int.parse(stdin.readLineSync() ?? "0");
      if (itemId == 0) {
        final double totalQuantity = order.lines.fold(
          0,
          (previousValue, element) => previousValue + element.quantity,
        );
        final double totalPrice = order.lines.fold(
          0,
          (previousValue, element) =>
              previousValue + (element.unitPrice * element.quantity),
        );

        printColor(
          "Order #${order.id} created: Quantity = ${totalQuantity}, Total Price = ${totalPrice}",
          color: Colors.green,
        );
        break;
      }

      Product product =
          productList.firstWhere((element) => element.id == itemId);
      order.addProduct(product, 1);
      product.addStock(-1);
    }

    printColor("-------------------------------------------");
  }
}
