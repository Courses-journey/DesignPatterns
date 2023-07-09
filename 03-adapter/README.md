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
