import 'dart:collection';

import '../console/print_color.dart';
import 'order.dart';
import 'order_processor_base.dart';

class OrderProcessorQueueingDecorator extends OrderProcessorBase {
  // ignore: unused_field
  final OrderProcessorBase _orderProcessorBase;
  final Queue<Order> _queue = Queue();

  OrderProcessorQueueingDecorator(this._orderProcessorBase);

  @override
  void process(Order order) {
    _queue.add(order);
    printColor("Order has been queued", color: Colors.yellow);
  }
}
