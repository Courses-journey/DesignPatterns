import 'dart:math';

import '../payment_lib/payment.dart';
import '../payment_lib/payment_base.dart';

class PaypalPaymentMethod extends PaymentBase {
  @override
  Payment charge(int customerId, double amount) {
    return Payment(
      customerId: customerId,
      chargeAmount: amount + amount < 10000 ? amount * 0.02 : 0,
      uuid:
          Random().nextInt(999999) + 111111, // Don't do that, use uuid package
    );
  }
}
