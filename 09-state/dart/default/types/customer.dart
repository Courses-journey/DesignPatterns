import 'customer_category.dart';

class Customer {
  final int id;
  final String name;
  final CustomersCategory category;
  Customer({
    required this.id,
    required this.name,
    required this.category,
  });
}
