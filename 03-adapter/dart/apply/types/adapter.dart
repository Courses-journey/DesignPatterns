import 'legacy.dart';
import 'target.dart';

class Adapter extends Target {
  final Legacy legacy;
  Adapter(this.legacy) : super(fullName: legacy.fullName, data: legacy.data);

  @override
  String handleData() {
    return """
    ${legacy.handleData()}
    Adapter ${data}
    ${super.handleData()}
    """;
  }
}
