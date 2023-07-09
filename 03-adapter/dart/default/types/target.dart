class Target {
  final String fullName;
  final Map<String, dynamic> data;
  Target({
    required this.fullName,
    required this.data,
  });
  String handleData() => "Target $data";
}
