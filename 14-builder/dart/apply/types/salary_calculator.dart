import '../console/print_color.dart';
import 'employee.dart';

class SalaryCalculator {
  final int taxPercentage;
  final double bonusPercentage;
  final double educationPackage;
  final double transportation;
  final bool sendPayslipToEmployee;
  final bool postResultToGl;

  SalaryCalculator({
    this.taxPercentage = 0,
    this.bonusPercentage = 0,
    this.educationPackage = 0,
    this.transportation = 0,
    this.sendPayslipToEmployee = true,
    this.postResultToGl = true,
  });

  double calculate(Employee employee) {
    final bonus = employee.basicSalary * bonusPercentage / 100;
    final taxes = employee.basicSalary * taxPercentage / 100;
    final salary = employee.basicSalary +
        educationPackage +
        transportation +
        bonus -
        taxes;

    if (sendPayslipToEmployee) {
      printColor("Payslip has been sent to ${employee.email}",
          color: Colors.purple);
    }
    if (sendPayslipToEmployee) {
      printColor(
          "Salary voucher with total amount (${salary} EGP) has been sent to GL",
          color: Colors.purple);
    }
    return salary;
  }
}
