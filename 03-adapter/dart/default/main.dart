import 'dart:io';

import 'types/legacy.dart';
import 'types/target.dart';

int main() {
  final Legacy legacy = Legacy(
    firstName: "firstName",
    middleName: "middleName",
    lastName: "lastName",
    data: {"avatar": "http://url"},
  );

  /// Imagine if there are many property to input
  /// or there is some data need to be handled or convert
  /// it would be a pain
  final Target target = Target(
    fullName: legacy.fullName,
    data: legacy.data,
  );

  stdout.write(target.fullName);
  stdout.write("\n");
  stdout.write(target.handleData());

  return 0;
}
