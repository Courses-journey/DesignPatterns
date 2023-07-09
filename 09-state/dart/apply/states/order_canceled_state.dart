import '../console/print_color.dart';
import '../types/order.dart';
import 'order_confirmed_state.dart';
import 'order_state_base.dart';

class OrderCanceledState extends OrderStateBase {
  final Order _order;
  OrderCanceledState(this._order);

  @override
  void canceled() {
    printColor("Already Canceled", color: Colors.yellow);
  }

  @override
  void confirmed() {
    _order.state = OrderConfirmedState(_order);
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
    printColor("Invalid Transition Operation", color: Colors.red);
  }
}
