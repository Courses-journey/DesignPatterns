## 09- State

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=9)

### Definition

Behavioral pattern used to change app behavior based on its state

### Use Cases

- Like ATM
  - States
    - NoCard
    - CardChecking
    - WaitUserAction
    - WithdrawMoney
- Online shopping
  - States
    - confirmed
    - processing
    - Shipped
    - delivering
    - delivered
- `@7` Like BLoC state management

### How to impl?

- Create State `interface` class for states
  - Put all methods that may change state
- Create class for each state

- When it comes to `state` classes there are two ways
  - `state` is fully responsible for
    - its business logic
    - transition logic
  - or
    - `state` is responsible for its business logic
    - `context` responsible for transition logic

### Note

- Object that have states called `context`
- In Dart we cannot init `ClassA` by passing `ClassA` to another `ClassB` which required `ClassA` as input parameters
  - so I make a standalone object called `classAContext`
    - which take `ClassA` and `state`
