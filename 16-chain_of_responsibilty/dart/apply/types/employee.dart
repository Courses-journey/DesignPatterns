// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'job_title_enum.dart';

class Employee {
  int id;
  String name;
  DateTime dateOfBirth;
  DateTime hireBirth;
  JobTitle jobTitle;
  bool isTerminated;
  Employee({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.hireBirth,
    required this.jobTitle,
    required this.isTerminated,
  });
}
