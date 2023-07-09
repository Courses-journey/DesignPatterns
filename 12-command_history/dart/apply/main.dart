import 'dart:io';

import 'commands/add_product_command.dart';
import 'commands/add_stock_command.dart';
import 'commands/command_invoker.dart';
import 'console/print_color.dart';
import 'dummy/products.dart';
import 'macro/macro_storage.dart';
import 'types/order.dart';
import 'types/product.dart';

int main() {
  while (true) {
    Order order = Order();
    CommandInvoker invoker = CommandInvoker();

    while (true) {
      String itemsListString = productList.fold(
        "",
        (previousValue, e) =>
            previousValue + "\n\t${e.id}. ${e.name} ${e.unitPrice}",
      );
      stdout.writeln("Product List:$itemsListString");
      stdout.writeln("\t4. Save Macro");
      stdout.writeln("\t5. Replay Macro");
      stdout.writeln("\t6. Undo");
      stdout.writeln("\t7. Redo");
      stdout.write("Enter Item ID (0 to process):  ");

      int itemId = int.parse(stdin.readLineSync() ?? "0");
      if (itemId == 0) {
        printOrder(order);
      }

      if (itemId > 0 && itemId <= productList.length) {
        Product product =
            productList.firstWhere((element) => element.id == itemId);

        /// 2 commands added
        invoker.executeCommand(AddProductCommand(order, product, 1));
        invoker.executeCommand(AddStockCommand(product, -1));
      } else if (itemId == 4) {
        MacroStorage.instance.CreateMacro(invoker.getCommands());
        invoker.clearCommands();
      } else if (itemId == 5) {
        replayMacro();
      } else if (itemId == 6) {
        /// 2 commands undone
        invoker.undo();
        invoker.undo();
        printOrder(order);
      } else if (itemId == 7) {
        /// 2 commands redone
        invoker.redo();
        invoker.redo();
        printOrder(order);
      }

      printColor("-------------------------------------------");
    }
  }
}

void replayMacro() {
  String itemsListString = MacroStorage.instance.macros.fold(
    "",
    (previousValue, e) =>
        previousValue +
        "\t${e.id}. Commands Count: ${e.commands.length} Created At: ${e.createdAt}\n",
  );
  stdout.writeln(itemsListString);
  stdout.write("Enter macro ID: ");
  int macroId = int.parse(
    stdin.readLineSync() ?? "0",
  );

  final selectedMacro = MacroStorage.instance.getMacro(macroId);
  final Order order = Order();
  final invoker = CommandInvoker();
  for (var command in selectedMacro.commands) {
    /// This additional check to set receiver
    /// If all commands needs to set their receiver
    /// then we could make setReceiver() method in Command Interface
    /// If all receiver are the same type
    if (command is AddProductCommand) {
      command.order = order;
    }
    invoker.addCommand(command);
  }
  invoker.executeCommands();
}

printOrder(Order order) {
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
}
