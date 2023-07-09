// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../types/order.dart';
import '../types/product.dart';
import 'command_base.dart';

class AddProductCommand extends CommandBase {
  final Order _order;
  final Product _product;
  final double _quantity;
  AddProductCommand(
    this._order,
    this._product,
    this._quantity,
  );

  @override
  void execute() {
    _order.addProduct(_product, _quantity);
  }
}
