// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../console/print_color.dart';

class Product {
  int _id;
  String _name;
  double _unitPrice;
  double _stockBalance;
  Product({
    required int id,
    required String name,
    required double unitPrice,
    required double stockBalance,
  })  : _id = id,
        _name = name,
        _unitPrice = unitPrice,
        _stockBalance = stockBalance;

  int get id => _id;
  String get name => _name;
  double get unitPrice => _unitPrice;
  double get stockBalance => _stockBalance;

  void addStock(double quantity) {
    _stockBalance += quantity;

    printColor(
      "Product $name stock changed to $stockBalance",
      color: Colors.cyan,
    );
  }
}
