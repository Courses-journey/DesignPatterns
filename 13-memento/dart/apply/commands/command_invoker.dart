import '../console/print_color.dart';
import 'command_base.dart';

class CommandInvoker {
  List<CommandBase> _commands = [];
  Stack<CommandBase> _executedCommands = Stack();
  Stack<CommandBase> _undoneCommands = Stack();

  List<CommandBase> getCommands() => List.from(_commands);

  void addCommand(CommandBase command) {
    _commands.add(command);
  }

  void executeCommands() {
    for (final command in _commands) {
      executeCommand(command);
    }
  }

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

  void clearCommands() {
    _commands.clear();
  }
}

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
