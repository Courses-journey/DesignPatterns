import '../payment_lib/payment_base.dart';
import '../payment_lib/payment_processor.dart';
import 'paypal_payment_method.dart';

class PaypalPaymentProcessor extends PaymentProcessor {
  @override
  PaymentBase createPaymentMethod() {
    return PaypalPaymentMethod();
  }
}
