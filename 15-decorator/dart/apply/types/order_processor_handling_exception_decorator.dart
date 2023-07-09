import '../console/print_color.dart';
import 'order.dart';
import 'order_processor_base.dart';

class OrderProcessorExceptionHandlingDecorator extends OrderProcessorBase {
  final OrderProcessorBase _orderProcessorBase;
  OrderProcessorExceptionHandlingDecorator(this._orderProcessorBase);

  @override
  void process(Order order) {
    try {
      _orderProcessorBase.process(order);
    } catch (e) {
      printColor(e, color: Colors.red);
    }
  }
}
