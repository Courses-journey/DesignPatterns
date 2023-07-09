## 08- Factory Method

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=8)

### Definition

Creational design pattern used to separate creation logic of specific instances of the class that belong to same Type or same base class which as a developer don't know what would be its implementation but the `client` developer who would use my package knows

### Use Cases

- Usually used in abstraction layer
- Base class of payment methods
  - The developer for example will implement visa and master card
  - And provide u a base class to extend to your country payment like `cash` or `fawrey`
- `@7` Base class for shapes to draw on canvas
  - Make shapeBase class and then make Circle, Rect, Triangles etc

### How to impl?

- Create Main Class `Payment`
- Create Base class `PaymentBase` that return the main class
  - Will be implemented later `PaymentMethod`
- Create Processor Base class `PaymentProcessor` that return implemented class `PaymentMethod`
  - Will be implemented later `VisaPaymentProcessor`

### Note

- Any pattern have `factory` in its name then its a creation pattern
- We can't use `simple factory` instead of `factory method`
- We can use `factory method` instead of `simple factory` if the creation is complex or objects take different parameters or depend on different sources
- U may found `factory method` similar to `template`
- If u found patterns similar to each other look at their intension or type `creational` or `behavioral`
  - `creational` responsible for creating
  - `behavioral` responsible for execution regardless who create or how to create
