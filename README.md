# DesignPatterns

Design Patterns Passionate Coders | محمد المهدي

- [Watch PlayList](https://www.youtube.com/playlist?list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR)

- `HassanELtantawy`
  - Examples in Dart languages.
  - Anything about dart.
  - Any thing prefixed with `@7`.
- `@ChatGPT` Answer provided using chatGPT

## 02- Singleton

- [Watch](https://www.youtube.com/watch?v=MfA48pQsXsg&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=2)

### Definition

- Creational design pattern ensure that during the life of our application only one instance of the class will be created
- The constructor will be called once

### Use Cases

- Dealing with static data or static resources
  - Data that not changing so much or change every long time
- Its acceptable to user that if the data changes the application will need to restart
  - For example: App Configuration
- `@7`Common for DbHelpers

### How to impl?

- Make the constructor private
- Make static private variable same as class type usually named as `instance`
- Encapsulate this variable to static property
  - U can't call it as the `instance` is null
- To initialize the `instance` we have two way
  - Early initialization
  - Lazy initialization

#### Early initialization

- If execution time is short
- doesn't need much memory `Memory footprint`

What if not?

- May have tracing and many thread call the instance and the last one will be the value

```dart
class Db {
  /// 01 Private constructor
  /// usually called **_internal**
  Db._();

  /// 02 create static instance of the class
  static final Db _instance = Db._();

  /// 03
  factory Db() {
    _instance = Db._();
    return _instance;
  }
}

Db db = Db();
```

```dart
class Db {
  /// 01 Private constructor
  /// usually called **_internal**
  Db._();

  /// 02 create static instance of the class
  static final Db instance = Db._();
}

Db db = Db.instance;
```

#### Lazy initialization

- In the Instance property check if null the create
- In c#
  - we make a `lock` Object as the thread when enter it locked for any other thread until the first one finished its work
  - We may use double check if instance is not null

```dart
class Db {
  /// 01 Private constructor
  /// usually called **_internal**
  Db._();

  /// 02 create static instance of the class
  static late Db _instance;

  /// 03
  factory Db() {
    _instance = Db._();
    return _instance;
  }
}
```

#### C# Static classes vs Singleton

- Static classes has limitations for example doesn't support OOP
- Use Static classes for utilities

## 03- Adapter

- [Watch](https://www.youtube.com/watch?v=9YNAPv4Uz98&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=3)

### Definition

Structural pattern used to change the form of our object to another form to adapt for different services we need to deal with

### Use Cases

- Easy to impl
- Useful in practical world
- Helpful when dealing with legacy systems
- Helpful when dealing with Codebase that u can't modified

  - `@7`
  - we won't deal with that in flutter as in c# we may use `.dll` files which are a compiled code
  - in flutter all thing is open source to u and u can modify or tweak it but u may want to touch a package for example to keep safe if the package have an update.

- U can imagine the phone charger for example take the 220v and convert it to 5v to adapt your device voltage
- Also the adapter u buy to use normal usb with type c

### How to impl?

- Using Composition or Inheritance

## 04- Strategy | Policy

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=4)

### Definition

Behavioral pattern used to define how something will be executed based on current context

- Very important design pattern
- Used in large scale and enterprise applications

- for examples in `Super Mario` game when u use jump button

  - If ground & no fly power up => Normal Jump Strategy.
  - If ground & has fly power up => Fly Strategy.
  - If in water => Swim Strategy.

- The context can be
  - User input
  - System decision.

### Use Cases

- There are a lot.

### How to impl?

- Make interfaces or abstracted classes

  - Create the base class
  - Create inherited classes for all strategies scenarios

- Create Context class or a manager class whatever u name that handle creation and context

## 05- Simple Factory

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=5)

### Definition

Creational design pattern used to separate creation logic of any instances of the class that belong to same Type or same base class to avoid ripple effect

- Applies OPP DRY "Don't Repeat Yourself"
- Applies OPP Encapsulate What varies

### Use Cases

### How to impl?

- Create Factory class

  - Its name commonly ends with `Factory`
  - Factory method commonly start with `create`

- Even if u create a method to handle that it's considered a Simple Factory

### Notes

- Don't over engineered it
- Keep it simple

## 06- Null Object

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=6)

### Definition

Behavioral design pattern to eliminate null checks in our code

### Use Cases

### How to impl?

- Create class that represent null scenario

## 07- Template Method

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=7)

### Definition

Behavioral design pattern used to specify the orders of operations without need to know how the operation work

### Use Cases

- Shopping carts (Online | Offline)
  - Process
    1. Apply Taxes // Fixed
    2. Apply Discount // Template
    3. Process Payment // Fixed

### How to impl?

- Create all process methods
- Make the process method that varies as abstracted to be implemented later

## 08- Factory Method

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=8)

### Definition

Creational design pattern used to separate creation logic of specific instances of the class that belong to same Type or same base class which as a developer don't know what would be its implementation but the `client` developer who would use my package knows

### Use Cases

- Usually used in abstraction layer
- Base class of payment methods
  - The developer for example will implement visa and master card
  - And provide u a base class to extend to your country payment like `cash` or `fawrey`
- `@7` Base class for shapes to draw on canvas
  - Make shapeBase class and then make Circle, Rect, Triangles etc

### How to impl?

- Create Main Class `Payment`
- Create Base class `PaymentBase` that return the main class
  - Will be implemented later `PaymentMethod`
- Create Processor Base class `PaymentProcessor` that return implemented class `PaymentMethod`
  - Will be implemented later `VisaPaymentProcessor`

### Note

- Any pattern have `factory` in its name then its a creation pattern
- We can't use `simple factory` instead of `factory method`
- We can use `factory method` instead of `simple factory` if the creation is complex or objects take different parameters or depend on different sources
- U may found `factory method` similar to `template`
- If u found patterns similar to each other look at their intension or type `creational` or `behavioral`
  - `creational` responsible for creating
  - `behavioral` responsible for execution regardless who create or how to create

## 09- State

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=9)

### Definition

Behavioral pattern used to change app behavior based on its state

### Use Cases

- Like ATM
  - States
    - NoCard
    - CardChecking
    - WaitUserAction
    - WithdrawMoney
- Online shopping
  - States
    - confirmed
    - processing
    - Shipped
    - delivering
    - delivered
- `@7` Like BLoC state management

### How to impl?

- Create State `interface` class for states
  - Put all methods that may change state
- Create class for each state

- When it comes to `state` classes there are two ways
  - `state` is fully responsible for
    - its business logic
    - transition logic
  - or
    - `state` is responsible for its business logic
    - `context` responsible for transition logic

### Note

- Object that have states called `context`
- In Dart we cannot init `ClassA` by passing `ClassA` to another `ClassB` which required `ClassA` as input parameters
  - so I make a standalone object called `classAContext`
    - which take `ClassA` and `state`

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

## 11- Command `(Macros)`

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=11)

### Definition `Macros`

Series of actions stored to rid of repetitive tasks

### Use Cases

- Record actions and replay them
- Store commands in database to apply them on other entity
  - Used in banking all operations u make stored in db and u can redo them

### How to impl?

- Create Macro Class

  - Main Property

    - id
    - List of command

  - U can create any property depend on your need

```dart
class Macro {
  final int id;
  final List<CommandBase> _commands;
  final DateTime createdAt = DateTime.now();
  Macro(
    this.id,
    this._commands,
  );
}
```

- Create Singleton MacroStorage or store in database or json or what do u want

```dart
class MacroStorage {
  /// Singleton
  MacroStorage._internal();
  static MacroStorage instance = MacroStorage._internal();
  /// If u want to call using constructor **MacroStorage()**
  /// u can remove it and call **MacroStorage.instance**
  factory MacroStorage() => instance;

  ///
  List<Macro> _macros = [];
  List<Macro> get macros => _macros;

  void CreateMacro(List<CommandBase> commands) {
    final Macro macro = Macro(_macros.length + 1, commands);
    _macros.add(macro);

    printColor("Macro #${macro.id} saved", color: Colors.green);
  }

  Macro getMacro(int id) {
    return _macros.firstWhere((e) => e.id == id);
  }
}
```

### Note

Remember

- Command Object need a receiver
  - `Receiver` object that has the method we want to call
- `Command` just call method

## 12- Command `(Undo/Redo)`

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=12)

### Definition

### Use Cases

- Make a history to undo and redo commands

### How to impl?

- Create Abstracted Command Base

```dart
abstract class CommandBase {
  /// Redo
  void execute();
  /// Undo
  void undo();
}
```

- Create Command Invoker
  - using stack
    - create stack to executed commands
    - create stack to undone commands

#### Implantation of stack using list

```dart
class Stack<T> {
  final List<T> _stack = [];

  void push(T element) {
    _stack.add(element);
  }

  T pop() {
    if (_stack.isEmpty) {
      throw StateError('Cannot pop from an empty stack');
    }
    return _stack.removeLast();
  }

  T peek() {
    if (_stack.isEmpty) {
      throw StateError('Stack is empty');
    }
    return _stack.last;
  }

  bool get isEmpty => _stack.isEmpty;

  int get length => _stack.length;

  void clear() {
    _stack.clear();
  }
}
```

#### Command Invoker using stack

```dart
class CommandInvoker {
  Stack<CommandBase> _executedCommands = Stack();
  Stack<CommandBase> _undoneCommands = Stack();

  void executeCommand(CommandBase command) {
    command.execute();
    _executedCommands.push(command);
  }

  void undo() {
    if (_executedCommands.isEmpty) {
      printColor("No Command to undo", color: Colors.red);
      return;
    }

    final command = _executedCommands.pop();
    command.undo();
    _undoneCommands.push(command);
  }

  void redo() {
    if (_undoneCommands.isEmpty) {
      printColor("No Command to redo", color: Colors.red);
      return;
    }

    final command = _undoneCommands.pop();
    executeCommand(command);
  }

  void clear(){
    _executedCommands.clear();
    _undoneCommands.clear();
  }
}
```

#### Command Invoker using List

If undo command and then add new command

- then remove all commands after current index

```dart
class History {
  final List<CommandBase> commands = [];
  int _currentCommandIndex = -1;
  int get currentCommandIndex => _currentCommandIndex;

  bool get canUndo => _currentCommandIndex >= 0;
  bool get canRedo => _currentCommandIndex < commands.length - 1;

  void addCommand(KuCommand command) {
    // Remove any commands that were undone
    commands.removeRange(_currentCommandIndex + 1, commands.length);
    // execute command
    command.execute();
    // Add the new command
    commands.add(command);
    _currentCommandIndex++;
  }

  void undo() {
    if (!canUndo) {
      printColor("No Command to undo", color: Colors.red);
      return;
    }
    final command = commands[_currentCommandIndex];
    command.undo();
    _currentCommandIndex--;
  }

  void redo() {
    if (!canRedo) {
      printColor("No Command to redo", color: Colors.red);
      return;
    }
    _currentCommandIndex++;
    final command = commands[_currentCommandIndex];
    command.execute();
  }

  void clear() {
    commands.removeRange(0, commands.length);
    _currentCommandIndex = -1;
  }
}
```

### Note

- `undo` always undo the last action

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

## 14- Builder

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=14)

### Definition

Creational pattern used to facilitate creation of complex objects

- widely used in `.NETCore`

### Use Cases

- Facilitate creation of complex objects
- The cost of creating the object is high so we need to differ creating it to the end
  - so we can cancel it before creating and get rid of its creation cost
- Create FLuent API

### How to impl?

- Create Builder class for the object u want
  - By conventional builder object's name end with Builder
  - Create all params from `Class` to `ClassBuilder`
  - Make separate method for every property and make it return the object to make a fluent API
  - Create Build Method that return Class

### Note

- Mutable objects wieldy used in
  - functional programming
  - DDD `Domain Driven Design`

#### Fluent API

- `@ChatGPT`

A fluent API (Application Programming Interface) is a style of designing an API that aims to create code that is easy to read, write, and understand. It focuses on making the code appear more like natural language and allows method chaining, resulting in a more expressive and concise code syntax.

In a fluent API, each method call returns an object or a reference to itself, allowing you to chain multiple method calls together in a single line. This chaining creates a fluent and readable code flow, resembling a series of sentences or statements.

The benefits of using a fluent API include:

- Readability: Fluent APIs are designed to read like a sentence, making the code more expressive and self-explanatory. It can help improve the readability of the code and make it easier to understand the intention behind the code.

- Conciseness: Method chaining in a fluent API allows you to perform multiple operations in a single line of code, reducing the amount of boilerplate code and making the code more compact.

- Discoverability: A well-designed fluent API provides discoverability of available operations and options. By chaining methods, developers can explore available options and easily understand what actions or configurations are possible.

- Maintainability: Fluent APIs separate the construction and configuration steps, making it easier to modify or extend the functionality without affecting the existing code. It provides a clear and consistent interface, which simplifies maintenance and reduces the likelihood of introducing bugs.

Here's an example of a fluent API in Dart:

```dart
class Calculator {
  double _result;

  Calculator(this._result);

  Calculator add(double value) {
    _result += value;
    return this;
  }

  Calculator subtract(double value) {
    _result -= value;
    return this;
  }

  Calculator multiply(double value) {
    _result *= value;
    return this;
  }

  Calculator divide(double value) {
    _result /= value;
    return this;
  }

  double getResult() {
    return _result;
  }
}
```

```dart
void main() {
  var result = Calculator(10)
      .add(5)
      .multiply(2)
      .subtract(3)
      .divide(4)
      .getResult();

  print('Result: $result'); // Output: Result: 3.25
}

```

In the example above, the `Calculator` class implements a fluent API for performing arithmetic operations. Each method returns a reference to the `Calculator` object itself, allowing multiple operations to be chained together. This chaining style results in a more readable and concise representation of the calculation process.

#### External DSL

- `@ChatGPT`

An External DSL (Domain-Specific Language) is a programming language or a specialized language designed for a specific domain or problem space. Unlike a general-purpose programming language (such as Java, Python, or C++), an external DSL is created specifically to address the needs and requirements of a particular domain.

An external DSL is usually created as a separate language with its own syntax, semantics, and tools. It provides a higher level of abstraction tailored to a specific problem domain, making it easier for domain experts or non-programmers to express their intent in a concise and natural way.

```dart
class Song {
  final String title;
  final String artist;

  Song(this.title, this.artist);
}

class Playlist {
  final List<Song> songs;

  Playlist(this.songs);

  void play() {
    print('Playing playlist:');
    for (var song in songs) {
      print('Title: ${song.title}, Artist: ${song.artist}');
    }
  }
}

class PlaylistBuilder {
  final List<Song> songs = [];

  void addSong(String title, String artist) {
    songs.add(Song(title, artist));
  }

  Playlist build() {
    return Playlist(songs);
  }
}
```

```dart
void main() {
  var Playlist = PlaylistBuilder()
      ..addSong('Song 1', 'Artist 1')
      ..addSong('Song 2', 'Artist 2')
      ..addSong('Song 3', 'Artist 3')
      ..build();

  playlist.play();
}

```

## 15- Decorator | Wrapper

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=15)

### Definition

Structural pattern used to modify the behavior of an object at the runtime or add new functionality to it.

### Use Cases

- Modify the behavior of an object at the runtime
- Add new functionality to it.
- Help to satisfy Open CLosed Principle
- Profiling some functionality in peek time or queue some of them if need to make system available

### How to impl?

- First your class should have an interface if not there is another way
- Method should have `virtual` for cSharp in dart when don't need that
  - extend and then use `@override` annotation above method signature.
- Create class for your decorators that extend `base class` of your object
- Pass `base class` as param in decorator constructor to extend its functionality

### Note

#### Tightly coupled

Tightly coupled objects refer to objects that are highly dependent on each other. In such a design, changes in one object may require modifications in multiple related objects. Tightly coupled code can make it harder to maintain, test, and extend the system, as it reduces flexibility and increases the risk of introducing bugs.

## 16- Chain of Responsibility

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=16)

### Definition

`@ChatGPT`

Behavioral design pattern that allows an object to pass a request along a chain of potential handlers. Each handler in the chain has the ability to either handle the request or pass it to the next handler in the chain. This pattern promotes loose coupling between the sender of a request and its receivers.

### Use Cases

- Approval cycle
- `MiddleWare` in `.NETCore`

### How to impl?

- Create `abstracted handler class base`
  - create `void setNextHandler(Base base)`
  - create process that take the request `void process(Request request)`
- Create abstracted handler class that extend the `base class`
  - Add `Base? _next` property
  - Implement `void setNextHandler(Base next){}` that assigned `next` to `_next`
  - Add `void callNext(Request request){}` which call process of `_next` if not null
- Now we have created the chain body let's create the chain itself
- Create all Handler using given business needs
- Create Instance of each handler Then chain them

### Disadvantages

- Increase system complexity.
- Debugging not so easy
- Always have a fallback mechanism if the request doesn't have handler to process

### Note

- The pattern named `chain of Responsibility` so every chain know the next chain
