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
