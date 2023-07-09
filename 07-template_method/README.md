## 07- Template Method

- [Watch](https://www.youtube.com/watch?v=MdB6zKDeb44&list=PLsV97AQt78NTrqUAZM562JbR3ljX19JFR&index=7)

### Definition

Behavioral design pattern used to specify the orders of operations without need to know how the operation work

### Use Cases

- Shopping carts (Online | Offline)
  - Process
    1. Apply Taxes // Fixed
    2. Apply Discount // Template
    3. Process Payment // Fixed

### How to impl?

- Create all process methods
- Make the process method that varies as abstracted to be implemented later
