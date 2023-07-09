## 10- Command

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=10)

### Definition

Behavioral pattern used to encapsulate request into object

- Convert request to an object
- Request is method call

```dart
/// Our Object
class Car{
  void go(double speed, Offset dir){
    print("Car Go at Speed: $speed | to direction $dir !");
  }

  void stop(){
    print("Car Stop!");
  }
}

Car car = Car();

///Method call
car.go(120,Offset(-1,1));
```

### Use Cases

- Queuing - Schedule - differ execution
- Retry Policy if there is failure
  - Rollback to all previous commands
- History Redo and Undo
- Macros "Replay" to record actions and replay them
- Store commands in database to apply them on other entity
  - Used in banking all operations u make stored in db and u can redo them

### How to impl?

- Create Abstracted Command Base

```dart
abstract class CommandBase {
  /// Could be void or anything u want
  void execute();
}
```

- Convert request to an object
  - Have the `receiver`
    - object that has the method we want to call
  - Pass all parameters it needs to call method from constructor
  - doesn't have business logic it just wrapping the business logic it calls

```dart
class GoCarCommand extend CommandBase {
  /// **Car** Represent Receiver
  final Car _car;

  /// params
  final double _speed;
  final Offset _dir;

  GoCarCommand(
  this._car,
  this._speed,
  this._dir,
  );

  void execute(){
    /// Use the receiver to call our method
    _car.go(_speed, _dir);
  }
}
```

- Create Command Invoker
  - Optional component.
  - If u don't need queuing don't create it.

```dart
class CommandInvoker {
  List<CommandBase> commandList = [];

  void addCommand(CommandBase command){

  }

  void executeCommands(){

  }
}
```

### Note
