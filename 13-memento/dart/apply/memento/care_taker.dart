import 'order_memento.dart';

class CareTaker {
  List<OrderMemento> _mementos = [];

  int addMemento(OrderMemento orderMemento) {
    _mementos.add(orderMemento);
    return _mementos.length - 1;
  }

  OrderMemento getMemento(int index) {
    return _mementos[index];
  }
}
