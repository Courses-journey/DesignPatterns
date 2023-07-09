import 'dummy/customers.dart';

import 'dart:io';
import 'types/customer.dart';
import 'types/customer_category.dart';
import 'types/invoice.dart';
import 'types/invoice_item.dart';

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

    /// Handle Creation and context
    Invoice invoice = Invoice(
      customer: customer,
      items: [
        InvoiceItem(
          quantity: quantity,
          unitPrice: unitPrice,
        ),
      ],
      discountPercentage: 0,
    );

    /// Get the proper strategy
    /// This would be a horrible code when extended
    final double discountPercentage;
    switch (customer.category) {
      case CustomersCategory.gold:
        discountPercentage = invoice.totalPrice > 10000 ? .05 : 0;
        break;
      case CustomersCategory.silver:
        discountPercentage = invoice.totalPrice > 10000 ? .02 : 0;
        break;
      case CustomersCategory.recent:
        discountPercentage = 0;
        break;
    }

    invoice = invoice.copyWith(
      discountPercentage: discountPercentage,
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
