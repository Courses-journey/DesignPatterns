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
