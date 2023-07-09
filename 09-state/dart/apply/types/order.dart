import '../states/order_draft_state.dart';
import '../states/order_state_base.dart';
import 'order_line.dart';

class Order {
  final List<OrderLine> lines;
  late OrderStateBase state;

  Order({
    required this.lines,
  }) {
    state = OrderDraftState(this);
  }

  void confirmed() {
    state.confirmed();
  }

  void canceled() {
    state.canceled();
  }

  void underProcessing() {
    state.underProcessing();
  }

  void shipped() {
    state.shipped();
  }

  void delivered() {
    state.delivered();
  }

  void returned() {
    state.returned();
  }
}
