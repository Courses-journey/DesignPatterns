// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../commands/command_base.dart';

class Macro {
  final int id;
  final List<CommandBase> _commands;
  final DateTime createdAt = DateTime.now();

  Macro(
    this.id,
    this._commands,
  );

  List<CommandBase> get commands => _commands;
}
