import '../payment_lib/payment_base.dart';
import '../payment_lib/payment_processor.dart';
import 'visa_payment_method.dart';

class VisaPaymentProcessor extends PaymentProcessor {
  @override
  PaymentBase createPaymentMethod() {
    return VisaPaymentMethod();
  }
}
