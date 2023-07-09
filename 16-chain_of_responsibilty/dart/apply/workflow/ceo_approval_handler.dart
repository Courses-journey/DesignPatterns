import '../console/print_color.dart';
import '../types/job_title_enum.dart';
import '../types/vacation_request.dart';
import 'approval_handler.dart';

class CEOApprovalHandler extends ApprovalHandler {
  @override
  void process(VacationRequest request) {
    /// CEO can approve CTO requests

    if (request.employee.jobTitle == JobTitle.CTO) {
      printColor(
        "Request has been approved by CEO",
        color: Colors.green,
      );
    } else {
      callNext(request);
    }
  }
}
