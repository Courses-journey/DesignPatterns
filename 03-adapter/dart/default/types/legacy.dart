// ignore_for_file: public_member_api_docs, sort_constructors_first
class Legacy {
  final String firstName;
  final String middleName;
  final String lastName;
  final Map<String, dynamic> data;
  Legacy({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.data,
  });
  String get fullName => "$firstName $middleName $lastName";
  String handleData() => "Legacy $data";
}
