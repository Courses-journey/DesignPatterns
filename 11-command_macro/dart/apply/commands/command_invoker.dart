import 'command_base.dart';

class CommandInvoker {
  List<CommandBase> _commands = [];

  List<CommandBase> getCommands() => List.from(_commands);

  void addCommand(CommandBase command) {
    _commands.add(command);
  }

  void executeCommands() {
    for (final command in _commands) {
      command.execute();
    }
  }

  void clearCommands() {
    _commands.clear();
  }
}
