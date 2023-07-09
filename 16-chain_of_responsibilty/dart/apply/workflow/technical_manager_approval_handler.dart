import '../console/print_color.dart';
import '../types/job_title_enum.dart';
import '../types/vacation_request.dart';
import 'approval_handler.dart';

class TechnicalManagerApprovalHandler extends ApprovalHandler {
  @override
  void process(VacationRequest request) {
    /// Technical Manager can approve Developer requests with more than 3 days and Team Leader requests as well

    if (request.employee.jobTitle == JobTitle.teamLeader ||
        (request.employee.jobTitle == JobTitle.developer &&
            request.totalDays > 3)) {
      printColor(
        "Request has been approved by TechnicalManager",
        color: Colors.green,
      );
    } else {
      callNext(request);
    }
  }
}
