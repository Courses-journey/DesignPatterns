// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../types/product.dart';
import 'command_base.dart';

class AddStockCommand extends CommandBase {
  final Product _product;
  final double _quantity;
  AddStockCommand(
    this._product,
    this._quantity,
  );
  @override
  void execute() {
    _product.addStock(_quantity);
  }
}
