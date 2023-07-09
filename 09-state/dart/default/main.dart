import 'dart:io';

import 'dummy/items.dart';
import 'types/order_line.dart';
import 'types/item.dart';
import 'types/order.dart';
import 'types/order_state.dart';

int main() {
  while (true) {
    String itemsListString = itemsList.fold(
      "",
      (previousValue, e) =>
          previousValue + "\t${e.id}. ${e.name} ${e.unitPrice}\n",
    );
    stdout.writeln("Items List:\n$itemsListString");

    Order order = Order(lines: [], state: OrderState.draft);

    while (true) {
      stdout.write("\nEnter Item ID (0 to checkout):  ");
      int itemId = int.parse(stdin.readLineSync() ?? "0");
      if (itemId == 0) break;

      stdout.write("Enter Item Quantity:  ");
      int quantity = int.parse(stdin.readLineSync() ?? "0");

      Item item = itemsList.firstWhere((element) => element.id == itemId);
      order.lines.add(
        OrderLine(
          productId: itemId,
          quantity: quantity,
          unitPrice: item.unitPrice,
        ),
      );
    }

    try {
      while (true) {
        stdout.writeln("\nSelect Action: ");
        stdout.writeln("\t1. Confirmed");
        stdout.writeln("\t2. Under Processing");
        stdout.writeln("\t3. Canceled");
        stdout.writeln("\t4. shipped");
        stdout.writeln("\t5. Delivered");
        stdout.writeln("\t6. Returned");
        stdout.writeln("\t0. Exit");
        stdout.write("Enter Action:  ");
        int action = int.parse(stdin.readLineSync() ?? "0");

        if (action == 0) break;
        switch (action) {
          case 1:
            order.setState(newState: OrderState.confirmed);
          case 2:
            order.setState(newState: OrderState.underProcessing);
          case 3:
            order.setState(newState: OrderState.canceled);
          case 4:
            order.setState(newState: OrderState.shipped);
          case 5:
            order.setState(newState: OrderState.delivered);
          case 6:
            order.setState(newState: OrderState.returned);
        }

        stdout.writeln("Order State Changed to ${order.state}");
      }
    } catch (e) {
      stdout.writeln("\nXXXXXXXXXXXXXXXXXXXXXXXXX");
      stdout.writeln(e);
      stdout.writeln("XXXXXXXXXXXXXXXXXXXXXXXXX");
    }

    stdout.write("\n\nEnter 0 to exit or 1 to continue: ");
    int input = int.parse(stdin.readLineSync() ?? "0");
    if (input == 0) break; //Break loop
    stdout.write("\n====================================\n");
  }

  return 0;
}
