// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import '../types/order_line.dart';

class OrderMemento {
  final UnmodifiableListView<OrderLine> lines;
  OrderMemento(List<OrderLine> lines) : lines = UnmodifiableListView(lines);
}
