import '../console/print_color.dart';
import '../types/job_title_enum.dart';
import '../types/vacation_request.dart';
import 'approval_handler.dart';

class TeamLeaderApprovalHandler extends ApprovalHandler {
  @override
  void process(VacationRequest request) {
    /// Team Leader can approve Developer requests up to 3 days otherwise it goes to Technical manager

    if (request.employee.jobTitle == JobTitle.developer &&
        request.totalDays <= 3) {
      printColor(
        "Request has been approved by TeamLeader",
        color: Colors.green,
      );
    } else {
      callNext(request);
    }
  }
}
