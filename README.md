# 🧮 StepCalculator

A Swift console calculator with **step‑by‑step input**.  
Choose an operation first, then enter two numbers – the result is displayed immediately.

## 🎯 Features

- ➕ Addition (`add`)
- ➖ Subtraction (`sub`)
- ✖️ Multiplication (`mul`)
- ➗ Division (`div`)
- 🚪 Exit (`exit`)

## 🛠️ Technologies

- Swift
- `enum` with a `perform` method that handles the calculation logic
- A reusable function for safe numeric input
- A labeled loop (`loop:`) to break out of the main program

## 🧠 Key idea

The calculation logic lives **inside the `enum`** – each command knows how to operate on two numbers.

## 📝 Example
add
Enter first number: 5
Enter second number: 3
8.0

div
Enter first number: 10
Enter second number: 0
Division by zero

exit
Bye, bro!

text

## 📋 Commands

| Command | Action |
|---------|--------|
| `add` | add two numbers |
| `sub` | subtract the second from the first |
| `mul` | multiply two numbers |
| `div` | divide the first by the second |
| `exit` | quit the program |

## 👤 Author

Valeria Ponik (vale-ponick)
