import '../types/vacation_request.dart';

abstract class ApprovalHandlerBase {
  void setNextHandler(ApprovalHandlerBase next);
  void process(VacationRequest request);
}
