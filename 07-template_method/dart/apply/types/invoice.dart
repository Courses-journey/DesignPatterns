// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'customer.dart';
import 'invoice_item.dart';

class Invoice {
  final Customer customer;
  final List<InvoiceItem> items;
  final double discountPercentage;
  final double taxes;

  Invoice({
    required this.customer,
    required this.items,
    required this.discountPercentage,
    required this.taxes,
  });

  double get totalPrice => items.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + element.unitPrice * element.quantity,
      );

  double get netPrice => totalPrice - (totalPrice * discountPercentage);

  Invoice copyWith({
    Customer? customer,
    List<InvoiceItem>? items,
    double? discountPercentage,
    double? taxes,
  }) {
    return Invoice(
      customer: customer ?? this.customer,
      items: items ?? this.items,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      taxes: taxes ?? this.taxes,
    );
  }
}
