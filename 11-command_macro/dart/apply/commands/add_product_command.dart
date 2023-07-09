// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../types/order.dart';
import '../types/product.dart';
import 'command_base.dart';

class AddProductCommand extends CommandBase {
  Order order;
  final Product _product;
  final double _quantity;
  AddProductCommand(
    this.order,
    this._product,
    this._quantity,
  );

  @override
  void execute() {
    order.addProduct(_product, _quantity);
  }
}
