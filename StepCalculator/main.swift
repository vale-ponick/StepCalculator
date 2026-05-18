//
//  main.swift
//  StepCalculator
//
//  Created by Валерия Пономарева on 17.05.2026.
//

import Foundation

// MARK: - 1️⃣ Описание программы
print("✅ StepCalculator 📋 Пользователь вводит команду (add, sub, mul, div). Программа запрашивает два числа, вычисляет результат и завершается по exit")

// MARK: - 2️⃣ Модель данных (команды)
enum Command: String {
    case add = "add"
    case sub = "sub"
    case mul = "mul"
    case div = "div"
    case exit = "exit"
    
    // 2️⃣.1 Метод "выполнить команду"
    func perform(_ a: Double, _ b: Double) -> String { // perform с англ. «выполни команду»
        switch self {
        case .add:
            return "\(a + b)"
        case .sub:
            return "\(a - b)"
        case .mul:
            return "\(a * b)"
        case .div:
            if b == 0 {
                return "Division by zero"
            } else {
                return "\(a / b)"
            }
        case .exit:
            return "Unexpected exit"
        }
    }
}
// MARK: - 3️⃣ Вспомогательная функция безопасного ввода чисел
func readDouble(prompt: String) -> Double? {
    print(prompt, terminator: "")
    guard let input = readLine()?.trimmingCharacters(in: .whitespaces),
          !input.isEmpty else {
        return nil
    }
    return Double(input)
}
// MARK: - 4️⃣ Основная программа
loop: while true {
    // 4️⃣.1 Приглашение к вводу
    print("\n> ", terminator: "")
    // 4️⃣.2 Чтение и очистка ввода
    guard let input = readLine()?.trimmingCharacters(in: .whitespaces),
          !input.isEmpty else {
        continue
    }
    // 4️⃣.3 Преобразование строки в команду
    guard let command = Command(rawValue: input) else {
        print("Unknown command. Use add, sub, mul, div, exit")
        continue
    }
    // 4️⃣.4 Обработка команды
    switch command {
    case .exit:
        print("Bye, bro!")
        break loop

    default:
        // 4️⃣.5 Ввод первого числа
        guard let a = readDouble(prompt: "Enter first number: ") else {
            print("❌ Invalid number")
            continue
        }
        // 4️⃣.6 Ввод второго числа
        guard let b = readDouble(prompt: "Enter second number: ") else {
            print("❌ Invalid number")
            continue
        }
        // 4️⃣.7 Вычисление и вывод результата
        let result = command.perform(a, b)
        print(result)
    }
}
