printColor(Object? object, {int color = 0}) {
  final orangeText = '\u001b[${color}m${object.toString()}\u001b[0m';
  print(orangeText);
}

class Colors {
  static int red = 31;
  static int green = 32;
  static int yellow = 33;
  static int blue = 34;
  static int purple = 35;
  static int cyan = 36;
}
