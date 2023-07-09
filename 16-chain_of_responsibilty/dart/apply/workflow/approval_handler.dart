import '../types/vacation_request.dart';
import 'approval_handler_base.dart';

abstract class ApprovalHandler extends ApprovalHandlerBase {
  ApprovalHandlerBase? _next;

  @override
  void process(VacationRequest request);

  @override
  void setNextHandler(ApprovalHandlerBase next) {
    _next = next;
  }

  void callNext(VacationRequest request) {
    if (_next != null) _next!.process(request);
  }
}
