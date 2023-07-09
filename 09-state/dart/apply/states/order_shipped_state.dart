import '../console/print_color.dart';
import '../types/order.dart';
import 'order_delivered_state.dart';
import 'order_state_base.dart';

class OrderShippedState extends OrderStateBase {
  final Order _order;
  OrderShippedState(this._order);

  @override
  void canceled() {
    printColor("Invalid Transition Operation", color: Colors.red);
  }

  @override
  void confirmed() {
    printColor("Invalid Transition Operation", color: Colors.red);
  }

  @override
  void delivered() {
    _order.state = OrderDeliveredState(_order);
  }

  @override
  void returned() {
    printColor("Invalid Transition Operation", color: Colors.red);
  }

  @override
  void shipped() {
    printColor("Already Shipped", color: Colors.yellow);
  }

  @override
  void underProcessing() {
    printColor("Invalid Transition Operation", color: Colors.red);
  }
}
