import 'dart:io';

import 'types/adapter.dart';
import 'types/legacy.dart';
import 'types/target.dart';

int main() {
  final Legacy legacy = Legacy(
    firstName: "firstName",
    middleName: "middleName",
    lastName: "lastName",
    data: {"avatar": "http://url"},
  );

  final Target target = Adapter(legacy);

  stdout.write(target.fullName);
  stdout.write("\n");
  stdout.write(target.handleData());

  return 0;
}
