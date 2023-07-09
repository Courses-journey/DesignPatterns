class Db {
  /// 01 Private constructor
  /// usually called **_internal**
  Db._() {
    _heavyFunction();
  }

  /// 02 create static instance of the class
  static Db? _instance;

  /// 03
  factory Db() {
    _instance ??= Db._();
    return _instance!;
  }

  ///************* */
  static Heavy? _heavy;

  /// Heavy function that called every time u create an instance
  void _heavyFunction() async {
    await Future.delayed(Duration(seconds: 10));
    _heavy ??= Heavy();
  }
}

///External Package
class Heavy {}
