import 'strategies_base.dart';

class GoldStrategy extends StrategiesBase {
  @override
  double getDiscount(double totalPrice) {
    return totalPrice > 10000 ? .05 : 0;
  }
}
