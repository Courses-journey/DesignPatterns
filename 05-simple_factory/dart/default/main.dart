import 'dummy/customers.dart';

import 'dart:io';

import 'strategies/gold_strategies.dart';
import 'strategies/recent_strategies.dart';
import 'strategies/silver_strategies.dart';
import 'strategies/strategies_base.dart';
import 'types/customer.dart';
import 'types/customer_category.dart';
import 'types/invoice.dart';
import 'utils/invoice_manager.dart';

int main() {
  while (true) {
    stdout.write("""
  Customer List: 
  [${customersList[0].id}] ${customersList[0].name}
  [${customersList[1].id}] ${customersList[1].name}
  [${customersList[2].id}] ${customersList[2].name}

  choose customer id to continue: """);

    int customerId = int.parse(stdin.readLineSync() ?? "0");
    if (customerId == 0) return 0; //Break loop

    stdout.write("Enter Item Quantity:  ");
    int quantity = int.parse(stdin.readLineSync() ?? "0");
    stdout.write("Enter Unit Price: ");
    double unitPrice = double.parse(stdin.readLineSync() ?? "0");

    /// Get selected Customer
    final Customer customer = customersList
        .where(
          (element) => element.id == customerId,
        )
        .first;

    /// Get the proper strategy
    /// If u need to define this [strategiesBase] in too many places in the app
    /// it would be against DRY principle
    /// it would be hard to make modification if there new business needs
    final StrategiesBase strategiesBase;
    switch (customer.category) {
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

    /// Handle Creation and context
    final InvoiceManager invoiceManager = InvoiceManager(
      strategiesBase: strategiesBase,
    );

    final Invoice invoice = invoiceManager.createInvoice(
      customer,
      quantity,
      unitPrice,
    );

    stdout.write(
      "\nInvoice Created for customer ${customer.name} with net price ${invoice.netPrice}",
    );

    stdout.write("\nEnter 0 to exit or 1 to continue: ");
    int input = int.parse(stdin.readLineSync() ?? "0");
    if (input == 0) return 0; //Break loop
    stdout.write("\n====================================\n");
  }
}
