import '../console/print_color.dart';
import '../types/order.dart';
import 'order_canceled_state.dart';
import 'order_state_base.dart';
import 'order_under_processing_state.dart';

class OrderConfirmedState extends OrderStateBase {
  final Order _order;
  OrderConfirmedState(this._order);

  @override
  void canceled() {
    _order.state = OrderCanceledState(_order);
  }

  @override
  void confirmed() {
    printColor("Already Confirmed", color: Colors.yellow);
  }

  @override
  void delivered() {
    printColor("Invalid Transition Operation", color: Colors.red);
  }

  @override
  void returned() {
    printColor("Invalid Transition Operation", color: Colors.red);
  }

  @override
  void shipped() {
    printColor("Invalid Transition Operation", color: Colors.red);
  }

  @override
  void underProcessing() {
    _order.state = OrderUnderProcessingState(_order);
  }
}
