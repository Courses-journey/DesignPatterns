import '../types/customer.dart';
import '../types/invoice.dart';
import '../types/invoice_item.dart';
import 'dart:io';

abstract class ShoppingCart {
  List<InvoiceItem> _invoiceItems = [];
  void addToCart(int itemId, int quantity, double unitPrice) {
    _invoiceItems.add(
      InvoiceItem(
        itemId: itemId,
        quantity: quantity,
        unitPrice: unitPrice,
      ),
    );
  }

  void checkOut(Customer customer) {
    Invoice invoice = Invoice(
      customer: customer,
      items: _invoiceItems,
      discountPercentage: 0,
      taxes: 0,
    );

    /// After this point we need three steps
    ///
    /// 1. Apply Taxes for all items in invoice
    /// 2. Apply discount if available // Template
    /// 3. Process Payment
    ///
    /// And that will be our template pattern

    invoice = applyTaxes(invoice);
    invoice = applyDiscount(invoice);
    processPayment(invoice);
  }

  Invoice applyTaxes(Invoice invoice) {
    /// Taxes fixed to 15%
    return invoice.copyWith(taxes: invoice.totalPrice * 0.15);
  }

  Invoice applyDiscount(Invoice invoice);

  void processPayment(Invoice invoice) {
    stdout.write(
      "[${this.runtimeType}] Invoice created for customer ${invoice.customer.name} with net price ${invoice.netPrice}",
    );
  }
}
