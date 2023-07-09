import '../console/print_color.dart';
import '../types/order.dart';
import 'order_state_base.dart';

class OrderReturnedState extends OrderStateBase {
  // ignore: unused_field
  final Order _order;
  OrderReturnedState(this._order);

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
