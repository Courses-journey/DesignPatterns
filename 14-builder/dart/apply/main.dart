import 'dart:io';
import 'console/print_color.dart';
import 'types/employee.dart';
import 'types/salary_calculator.dart';
import 'types/salary_calculator_builder.dart';

int main() {
  SalaryCalculatorBuilder salaryCalculatorBuilder = SalaryCalculatorBuilder();
  while (true) {
    printColor("Option List");
    printColor("\t1. Add 20% bonus");
    printColor("\t2. Deduct 10% Taxes");
    printColor("\t3. Add 2000 Education Package");
    printColor("\t4. Add 1000 Transportation");
    printColor("\t5. Post Result To Gl");
    printColor("\t6. Send Payslip To Employee");
    printColor("\t0. Build");
    stdout.write("Select an option: ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      salaryCalculatorBuilder.withBonus(20);
    } else if (choice == 2) {
      salaryCalculatorBuilder.withTaxes(10);
    } else if (choice == 3) {
      salaryCalculatorBuilder.withEducationPackage(2000);
    } else if (choice == 4) {
      salaryCalculatorBuilder.withTransportation(1000);
    } else if (choice == 5) {
      salaryCalculatorBuilder.withPostResultToGl(true);
    } else if (choice == 6) {
      salaryCalculatorBuilder.withSendPayslipToEmployee(true);
    } else if (choice == 0) {
      final SalaryCalculator salaryCalculator = salaryCalculatorBuilder.build();

      salaryCalculator.calculate(
        Employee(
          name: "name",
          basicSalary: 5000,
          email: "test@test.com",
        ),
      );

      salaryCalculatorBuilder = SalaryCalculatorBuilder();
    }
  }
}
