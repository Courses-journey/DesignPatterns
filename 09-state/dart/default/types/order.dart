import 'dart:io';

import 'order_line.dart';
import 'order_state.dart';

class Order {
  final List<OrderLine> lines;
  OrderState state;

  Order({
    required this.lines,
    required this.state,
  });

  void setState({required OrderState newState}) {
    final bool case01 =
        (state == OrderState.draft && newState != OrderState.confirmed);
    final bool case02 = (state == OrderState.confirmed &&
        newState != OrderState.canceled &&
        newState != OrderState.underProcessing);
    final bool case03 =
        (state == OrderState.underProcessing && newState != OrderState.shipped);
    final bool case04 =
        (state == OrderState.shipped && newState != OrderState.delivered);
    final bool case05 =
        (state == OrderState.delivered && newState != OrderState.returned);

    if (case01 || case02 || case03 || case04 || case05) {
      throw ProcessException(
        "Moving from state `$state` to state `$newState` is not supported",
        [],
      );
    } else {
      state = newState;
    }
  }
}
