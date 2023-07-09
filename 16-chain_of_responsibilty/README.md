## 16- Chain of Responsibility

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=16)

### Definition

`@ChatGPT`

Behavioral design pattern that allows an object to pass a request along a chain of potential handlers. Each handler in the chain has the ability to either handle the request or pass it to the next handler in the chain. This pattern promotes loose coupling between the sender of a request and its receivers.

### Use Cases

- Approval cycle
- `MiddleWare` in `.NETCore`

### How to impl?

- Create `abstracted handler class base`
  - create `void setNextHandler(Base base)`
  - create process that take the request `void process(Request request)`
- Create abstracted handler class that extend the `base class`
  - Add `Base? _next` property
  - Implement `void setNextHandler(Base next){}` that assigned `next` to `_next`
  - Add `void callNext(Request request){}` which call process of `_next` if not null
- Now we have created the chain body let's create the chain itself
- Create all Handler using given business needs
- Create Instance of each handler Then chain them

### Disadvantages

- Increase system complexity.
- Debugging not so easy
- Always have a fallback mechanism if the request doesn't have handler to process

### Note

- The pattern named `chain of Responsibility` so every chain know the next chain
