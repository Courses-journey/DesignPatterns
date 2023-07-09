import '../console/print_color.dart';
import '../types/vacation_request.dart';
import 'approval_handler.dart';

class RequestDaysValidationHandler extends ApprovalHandler {
  @override
  void process(VacationRequest request) {
    if (request.startDate.isBefore(request.endDate)) {
      callNext(request);
    } else {
      printColor(
        "Request has been rejected because of invalid days.",
        color: Colors.red,
      );
    }
  }
}
