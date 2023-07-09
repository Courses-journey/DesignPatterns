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
