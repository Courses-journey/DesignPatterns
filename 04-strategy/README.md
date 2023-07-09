## 04- Strategy | Policy

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=4)

### Definition

Behavioral pattern used to define how something will be executed based on current context

- Very important design pattern
- Used in large scale and enterprise applications

- for examples in `Super Mario` game when u use jump button

  - If ground & no fly power up => Normal Jump Strategy.
  - If ground & has fly power up => Fly Strategy.
  - If in water => Swim Strategy.

- The context can be
  - User input
  - System decision.

### Use Cases

- There are a lot.

### How to impl?

- Make interfaces or abstracted classes

  - Create the base class
  - Create inherited classes for all strategies scenarios

- Create Context class or a manager class whatever u name that handle creation and context
