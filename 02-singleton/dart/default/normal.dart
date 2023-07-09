/// Our Class
class Db {
  Db() {
    _heavyFunction();
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
