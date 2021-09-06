//
//  Runner.swift
//  
//
//  Created by Paul Thi on 9/5/21.
//

import Foundation

// MARK: - Runner
class Runner {
    
    // MARK: - Properties
    var operandStack: Stack<Float>
    
    // MARK: - Init
    init() {
        operandStack = Stack<Float>()
    }
    
    func start() {
        print("LETS GOOOOOO!!")
        print("> ", terminator:"")
        readSTDIN { result in
            switch result {
            case .success(let operand):
                if let operand = operand {
                    print(operand)
                } else {
                    print("No Operand Exists")
                }
            case .failure(let error):
                print(error.description)
            }
        }
    }
}

// MARK: - Private
private extension Runner {
    
    private func readSTDIN(completion: (Result<Float?, CommandError>) -> Void) {
        lineLoop: while let line = readLine() {
            switch line {
            case "q", "eof", "EOF": // End program
                break lineLoop
            case "show": // Shows entire stack
                print(operandStack.description)
            case "count":
                print(operandStack.count)
            default:
                let string = line.split(separator: " ")
                string.forEach { substring in
                    calculate(String(substring), completion: completion)
                }
            }
            print("> ", terminator:"")
        }
    }

    private func calculate(_ line: String, completion: (Result<Float?, CommandError>) -> Void) {
        if let operand = Float(line) {
            operandStack.push(operand)
            print(operand)
        } else {
            guard operandStack.count > 1 else {
                completion(.failure(CommandError.missingOperand))
                return
            }
            do {
                let operationType = try checkInputType(of: line)
                if let operand2 = operandStack.pop(), let operand1 = operandStack.pop() {
                    switch operationType {
                    case .plus:
                        operandStack.push(operand1 + operand2)
                    case .minus:
                        operandStack.push(operand1 - operand2)
                    case .multiply:
                        operandStack.push(operand1 * operand2)
                    case .divide:
                        operandStack.push(operand1 / operand2)
                    }
                }
                completion(.success(operandStack.peek()))
            } catch let error as CommandError {
                completion(.failure(error))
            } catch {
                completion(.failure(.commandError(error)))
            }
        }
    }

    private func checkInputType(of operatorString: String) throws -> Operator {
        if Operator.allCases.contains( where: { $0.rawValue == operatorString }) { // Arithmetic operators: + - * /
            guard let arithmeticOperator = Operator(rawValue: operatorString) else {
                throw CommandError.nonOperator
            }
            return arithmeticOperator
        }
        throw CommandError.nonOperator
    }
}
