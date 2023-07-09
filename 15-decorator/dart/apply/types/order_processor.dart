import 'dart:io';
import 'dart:math';

import '../console/print_color.dart';
import 'order.dart';
import 'order_processor_base.dart';

class OrderProcessor extends OrderProcessorBase {
  @override
  void process(Order order) {
    if (order.lines.length == 0) throw Exception("Order is empty");
    sleep(Duration(milliseconds: Random().nextInt(2000) + 1000));
    printColor("Order has been processed", color: Colors.green);
  }
}
