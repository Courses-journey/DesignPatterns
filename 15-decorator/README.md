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
