// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../console/print_color.dart';
import 'order.dart';
import 'order_processor_base.dart';

class OrderProcessorProfilingDecorator extends OrderProcessorBase {
  final OrderProcessorBase _orderProcessorBase;
  OrderProcessorProfilingDecorator(this._orderProcessorBase);

  void process(Order order) {
    final Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    _orderProcessorBase.process(order);
    stopwatch.stop();
    printColor(
      "Order took ${stopwatch.elapsed.inMilliseconds / 1000}s to be processed",
      color: Colors.purple,
    );
  }
}
