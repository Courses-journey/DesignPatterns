import '../console/print_color.dart';
import '../types/order.dart';
import 'order_shipped_state.dart';
import 'order_state_base.dart';

class OrderUnderProcessingState extends OrderStateBase {
  final Order _order;
  OrderUnderProcessingState(this._order);

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
    _order.state = OrderShippedState(_order);
  }

  @override
  void underProcessing() {
    printColor("Already in this phase", color: Colors.yellow);
  }
}
