import 'payment.dart';
import 'payment_base.dart';

abstract class PaymentProcessor {
  Payment process(int customerId, double amount) {
    final PaymentBase paymentMethod = createPaymentMethod();
    final Payment payment = paymentMethod.charge(customerId, amount);

    /// Do extra (print invoice, Send Email ...)

    return payment;
  }

  PaymentBase createPaymentMethod();
}
