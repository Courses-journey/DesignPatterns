import '../console/print_color.dart';
import 'salary_calculator.dart';

class SalaryCalculatorBuilder {
  int _taxPercentage = 0;
  double _bonusPercentage = 0;
  double _educationPackage = 0;
  double _transportation = 0;
  bool _sendPayslipToEmployee = true;
  bool _postResultToGl = true;

  SalaryCalculatorBuilder withTaxes(int taxes) {
    printColor("$taxes% taxes will deducted", color: Colors.green);
    _taxPercentage = taxes;
    return this;
  }

  SalaryCalculatorBuilder withBonus(double bonus) {
    printColor("$bonus% Bonus will added", color: Colors.green);
    _bonusPercentage = bonus;
    return this;
  }

  SalaryCalculatorBuilder withEducationPackage(double educationPackage) {
    printColor("$educationPackage EGP educationPackage will added",
        color: Colors.green);
    _educationPackage = educationPackage;
    return this;
  }

  SalaryCalculatorBuilder withTransportation(double transportation) {
    printColor("$transportation EGP transportation will added",
        color: Colors.green);
    _transportation = transportation;
    return this;
  }

  SalaryCalculatorBuilder withSendPayslipToEmployee(
    bool sendPayslipToEmployee,
  ) {
    _sendPayslipToEmployee = sendPayslipToEmployee;
    return this;
  }

  SalaryCalculatorBuilder withPostResultToGl(
    bool postResultToGl,
  ) {
    _postResultToGl = postResultToGl;
    return this;
  }

  SalaryCalculator build() {
    return SalaryCalculator(
      taxPercentage: _taxPercentage,
      bonusPercentage: _bonusPercentage,
      educationPackage: _educationPackage,
      transportation: _transportation,
      postResultToGl: _postResultToGl,
      sendPayslipToEmployee: _sendPayslipToEmployee,
    );
  }
}
