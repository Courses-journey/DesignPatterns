import '../console/print_color.dart';
import '../types/order.dart';
import 'order_returned_state.dart';
import 'order_state_base.dart';

class OrderDeliveredState extends OrderStateBase {
  final Order _order;
  OrderDeliveredState(this._order);

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
    printColor("Invalid Transition Operation", color: Colors.red);
  }

  @override
  void returned() {
    _order.state = OrderReturnedState(_order);
  }

  @override
  void shipped() {
    printColor("Invalid Transition Operation", color: Colors.red);
  }

  @override
  void underProcessing() {
    printColor("Already Delivered", color: Colors.yellow);
  }
}
