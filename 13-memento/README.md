## 13- Memento

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=13)

### Definition

- Behavioral pattern used to store a state of and object to return it later
  - Like taking a snapshot of the object

### Use Cases

- Taking a snapshot of the object

### How to impl?

- Create `Object memento class`
  - Hold the state of the object
  - Get only properties that represent state in the object
  - Memento is immutable means that the data couldn't change once it assigned
- Create `care taker class`
  - Store the mementos consider it like database
- Create two Method in `Originator`
  - First
  ```dart
    ObjectMemento saveStateToMemento() {
      return ObjectMemento();
    }
  ```
  - Second
  ```dart
  void restoreStateFromMemento(ObjectMemento objectMemento){
    this.params = objectMemento.params;
  }
  ```

### Note

- `Originator` the object which I store its state
  - Why this name?
    - because it take the responsibility to create a copy of memento object
  - why it take the responsibility?
    - because the property ob the object could be private fields inside the object itself
    - only the class itself who can know the actual state of himself `:(`

```dart
/// Originator
class Car{
  double speed;
  bool isRunning;
  Car(this.speed,this.isRunning);

  CarMemento saveStateToMemento() {
      return CarMemento(speed,isRunning);
  }

  void restoreStateFromMemento(CarMemento carMemento) {
      speed = carMemento.speed;
      isRunning = carMemento.isRunning;
  }
}
```

```dart
/// Memento class
class CarMemento{
  /// Must be mutable
  final double speed;
  final bool isRunning;
  Car(this.speed,this.isRunning);
}
```

```dart
/// Care Taker which store our mementos
class CarMemento {
  List<OrderMemento> _mementos = [];

  int addMemento(CarMemento orderMemento) {
    _mementos.add(orderMemento);
    return _mementos.length - 1;
  }

  OrderMemento getMemento(int index) {
    return _mementos[index];
  }
}

```
