import '../../../../10-command/dart/default/console/print_color.dart';
import '../commands/command_base.dart';
import 'macro.dart';

class MacroStorage {
  /// Singleton
  MacroStorage._internal();
  static MacroStorage instance = MacroStorage._internal();

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
