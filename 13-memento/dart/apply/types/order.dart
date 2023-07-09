import 'dart:math';

import '../console/print_color.dart';
import '../memento/order_memento.dart';
import 'order_line.dart';
import 'product.dart';

class Order {
  int id = Random().nextInt(999999) + 111111;
  List<OrderLine> _lines = [];
  List<OrderLine> get lines => _lines;

  void addProduct(Product product, double quantity) {
    _lines.add(
      OrderLine(
        productId: product.id,
        unitPrice: product.unitPrice,
        quantity: quantity,
      ),
    );

    printColor(
      "Product ${product.name} added, Order now contains ${_lines.length} products",
      color: Colors.yellow,
    );
  }

  void removeProductAt(int index) {
    _lines.removeAt(index);
  }

  OrderMemento saveStateToMemento() {
    return OrderMemento(List.from(_lines));
  }

  void restoreStateFromMemento(OrderMemento orderMemento) {
    _lines = orderMemento.lines;
  }
}
