import '../strategies/strategies_base.dart';
import '../types/customer.dart';
import '../types/invoice.dart';
import '../types/invoice_item.dart';

/// Class that create and handle context
class InvoiceManager {
  final StrategiesBase strategiesBase;

  InvoiceManager({required this.strategiesBase});

  Invoice createInvoice(Customer customer, int quantity, double unitPrice) {
    Invoice invoice = Invoice(
      customer: customer,
      items: [
        InvoiceItem(
          itemId: 0, //temp
          quantity: quantity,
          unitPrice: unitPrice,
        ),
      ],
      discountPercentage: 0,
      taxes: 0, //temp
    );

    invoice = invoice.copyWith(
      discountPercentage: strategiesBase.getDiscount(invoice.totalPrice),
    );

    return invoice;
  }
}
