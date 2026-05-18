//
//  main.swift
//  StepCalculator
//
//  Created by Валерия Пономарева on 17.05.2026.
//

import Foundation

print("✅ StepCalculator 📋 Пользователь вводит команду (add, sub, mul, div). Программа запрашивает два числа, вычисляет результат и завершается по exit")

enum Command: String {
    case add = "add"
    case sub = "sub"
    case mul = "mul"
    case div = "div"
    case exit = "exit"
    
    func perform(_ a: Double, _ b: Double) -> String {
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
            return "exit – this should not happen in calculation"
        }
    }
}

func readDouble(prompt: String) -> Double? {
    print(prompt, terminator: "")
    guard let input = readLine()?.trimmingCharacters(in: .whitespaces),
          !input.isEmpty else {
        return nil
    }
    return Double(input)
}

loop: while true {
    print("\n> ", terminator: "")
    guard let input = readLine()?.trimmingCharacters(in: .whitespaces),
          !input.isEmpty else {
        continue
    }
    guard let command = Command(rawValue: input) else {
        print("Unknown command. Use add, sub, mul, div, exit")
        continue
    }

    switch command {
    case .exit:
        print("Bye, bro!")
        break loop

    default:
        guard let a = readDouble(prompt: "Enter first number: ") else {
            print("❌ Invalid number")
            continue
        }
        guard let b = readDouble(prompt: "Enter second number: ") else {
            print("❌ Invalid number")
            continue
        }
        
        let result = command.perform(a, b)
        print(result)
    }
}
