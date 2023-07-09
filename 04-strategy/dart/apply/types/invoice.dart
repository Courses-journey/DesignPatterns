// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'customer.dart';
import 'invoice_item.dart';

class Invoice {
  final Customer customer;
  final List<InvoiceItem> items;
  final double discountPercentage;

  Invoice({
    required this.customer,
    required this.items,
    required this.discountPercentage,
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
  }) {
    return Invoice(
      customer: customer ?? this.customer,
      items: items ?? this.items,
      discountPercentage: discountPercentage ?? this.discountPercentage,
    );
  }
}
