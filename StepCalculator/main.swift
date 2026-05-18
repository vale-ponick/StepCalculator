//
//  main.swift
//  StepCalculator
//
//  Created by Валерия Пономарева on 17.05.2026.

import Foundation

// MARK: - 1️⃣ Описание программы //
print("✅ StepCalculator 📋")
print("Пользователь вводит команду (add, sub, mul, div).")
print("Программа запрашивает два числа, вычисляет результат и завершается по exit")

// MARK: - 2️⃣ Модель данных (команды)
enum Command: String {
    case add = "add"
    case sub = "sub"
    case mul = "mul"
    case div = "div"
    case exit = "exit"
    
    // 2️⃣.1 Метод Выполняет команду над двумя числами.
    func perform(_ a: Double, _ b: Double) throws -> Double { // Переиспользование кода (DRY) + Сигнатура функции сама говорит: м.б. ошибка perform ВНУТРИ enum
        switch self {
        case .add:
            return a + b
        case .sub:
            return a - b
        case .mul:
            return a * b
        case .div:
            if b == 0 { // Защита от краша
                throw CalculationError.divisionByZero // Единый механизм ошибок
            } else {
                return a / b
            }
        case .exit:
            throw CalculationError.invalidOperation // Единый механизм ошибок
        }
    }
}

enum CalculationError: Error, LocalizedError { // Ошибки — отдельный ТИП (профи подход)
    case divisionByZero
    case invalidOperation

    var errorDescription: String? {
        switch self {
        case .divisionByZero:
            return "Деление на ноль не допускается"
        case .invalidOperation:
            return "Такой операции не существует"
        }
    }
}

// MARK: - 3️⃣ Вспомогательная функция безопасного ввода чисел
func readDouble(prompt: String) -> Double? { // Не падает при неверном вводе
    print(prompt, terminator: "")
    guard let input = readLine()?.trimmingCharacters(in: .whitespaces),
          !input.isEmpty else {
        return nil
    }
    return Double(input)
}

// MARK: - 4️⃣ Основная программа: 4️⃣.1 – 4️⃣.7    Пошаговое описание алгоритма
loop: while true { // loop: while true + break loop -> метка для выхода из цикла
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
    case .exit: // Защита от неправильного вызова 
        print("Bye, bro!")
        break loop
        
    default:
        guard let a = readDouble(prompt: "Enter first number: ") else { // Ранний выход при ошибке
            print("❌ Invalid number")
            continue
        }
        guard let b = readDouble(prompt: "Enter second number: ") else {
            print("❌ Invalid number")
            continue
        }
        
        do { // Разделение логики вычисления и обработки ошибок
            let result = try command.perform(a, b)
            print("Result: \(result)")
        } catch let calculationError as CalculationError {
            print("❌ \(calculationError.localizedDescription)")
        } catch {
            print("❌ Unexpected error: \(error.localizedDescription)")
        }
    }
}
