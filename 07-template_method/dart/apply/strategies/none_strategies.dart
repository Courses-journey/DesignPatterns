import 'strategies_base.dart';

class NoneStrategy extends StrategiesBase {
  @override
  double getDiscount(double totalPrice) {
    return 0;
  }
}
