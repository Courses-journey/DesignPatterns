import 'strategies_base.dart';

class SilverStrategy extends StrategiesBase {
  @override
  double getDiscount(double totalPrice) {
    return totalPrice > 10000 ? .02 : 0;
  }
}
