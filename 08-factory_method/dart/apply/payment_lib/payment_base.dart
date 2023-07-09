import 'payment.dart';

abstract class PaymentBase {
  Payment charge(int customerId, double amount);
}
