import '../strategies/gold_strategies.dart';
import '../strategies/recent_strategies.dart';
import '../strategies/silver_strategies.dart';
import '../strategies/strategies_base.dart';
import '../types/customer_category.dart';

class CustomerDiscountStrategyFactory {
  StrategiesBase createCustomerDiscountStrategyFactory(
    CustomersCategory category,
  ) {
    final StrategiesBase strategiesBase;
    switch (category) {
      case CustomersCategory.gold:
        strategiesBase = GoldStrategy();
        break;
      case CustomersCategory.silver:
        strategiesBase = SilverStrategy();
        break;
      case CustomersCategory.recent:
        strategiesBase = RecentStrategy();
        break;
    }

    return strategiesBase;
  }
}
