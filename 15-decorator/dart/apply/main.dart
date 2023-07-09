import 'types/order.dart';
import 'types/order_processor.dart';
import 'types/order_processor_base.dart';
import 'types/order_processor_handling_exception_decorator.dart';
import 'types/order_processor_profile_decorator.dart';
import 'types/order_processor_queueing_decorator.dart';

int main() {
  Order order = Order();
  order.addLine(1, 5, 1000);
  order.addLine(2, 3, 2500);
  order.addLine(3, 4, 1200);

  OrderProcessorBase processor = OrderProcessor();
  processor = OrderProcessorExceptionHandlingDecorator(processor);
  processor = OrderProcessorProfilingDecorator(processor);
  processor.process(order);
  processor = OrderProcessorQueueingDecorator(processor);

  return 0;
}
