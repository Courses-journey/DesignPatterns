// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'employee.dart';

class VacationRequest {
  Employee employee;
  DateTime startDate;
  DateTime endDate;
  VacationRequest({
    required this.employee,
    required this.startDate,
    required this.endDate,
  });

  int get totalDays => endDate.difference(startDate).inDays;
}
