import '../console/print_color.dart';
import '../types/job_title_enum.dart';
import '../types/vacation_request.dart';
import 'approval_handler.dart';

class CTOApprovalHandler extends ApprovalHandler {
  @override
  void process(VacationRequest request) {
    /// CTO can approve Technical Manager requests

    if (request.employee.jobTitle == JobTitle.technicalManager) {
      printColor(
        "Request has been approved by CTO",
        color: Colors.green,
      );
    } else {
      callNext(request);
    }
  }
}
