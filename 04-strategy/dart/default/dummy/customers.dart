import '../types/customer.dart';
import '../types/customer_category.dart';

List<Customer> get customersList => [
      Customer(
        id: 1,
        name: "Hassan Hassan",
        category: CustomersCategory.gold,
      ),
      Customer(
        id: 2,
        name: "Ahmed Ahmed",
        category: CustomersCategory.silver,
      ),
      Customer(
        id: 3,
        name: "Ali Ali",
        category: CustomersCategory.recent,
      ),
    ];
