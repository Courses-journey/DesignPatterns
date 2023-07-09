abstract class OrderStateBase {
  void confirmed();
  void canceled();
  void underProcessing();
  void shipped();
  void delivered();
  void returned();
}
