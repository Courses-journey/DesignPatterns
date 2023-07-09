import 'types/employee.dart';
import 'types/job_title_enum.dart';
import 'types/vacation_request.dart';
import 'workflow/cto_approval_handler.dart';
import 'workflow/request_days_validation_handler.dart';
import 'workflow/team_leader_approval_handler.dart';
import 'workflow/technical_manager_approval_handler.dart';

/*
Team Leader can approve Developer requests up to 3 days otherwise it goes to Technical manager
Technical Manager can approve Developer requests with more than 3 days and Team Leader requests as well
CTO can approve Technical Manager requests
CEO can approve CTO requests
*/
int main() {
  final Employee employee = Employee(
    id: 1,
    name: "Ahmad",
    dateOfBirth: DateTime(1995, 1, 1),
    hireBirth: DateTime(2022, 1, 1),
    jobTitle: JobTitle.developer,
    isTerminated: false,
  );

  final VacationRequest request = VacationRequest(
    employee: employee,
    startDate: DateTime.now().add(Duration(days: 5)),
    endDate: DateTime.now().add(Duration(days: -10)),
  );

  final teamLeaderHandler = TeamLeaderApprovalHandler();
  final requestDaysValidationHandler = RequestDaysValidationHandler();
  final technicalManagerHandler = TechnicalManagerApprovalHandler();
  final ceoHandler = CTOApprovalHandler();
  final ctoHandler = CTOApprovalHandler();

  requestDaysValidationHandler.setNextHandler(teamLeaderHandler);
  teamLeaderHandler.setNextHandler(technicalManagerHandler);
  technicalManagerHandler.setNextHandler(ctoHandler);
  ctoHandler.setNextHandler(ceoHandler);

  requestDaysValidationHandler.process(request);

  return 0;
}
