import 'dart:collection';

import 'order_line.dart';

class Order {
  List<OrderLine> _lines = [];
  List<OrderLine> get lines => UnmodifiableListView(_lines);

  void addLine(int itemId, double quantity, double unitPrice) {
    _lines.add(
      OrderLine(
        itemId: itemId,
        unitPrice: unitPrice,
        quantity: quantity,
      ),
    );
  }
}
