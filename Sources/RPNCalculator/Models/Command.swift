//
//  Command.swift
//  
//
//  Created by Paul Thi on 9/2/21.
//

import ArgumentParser
import Foundation

// MARK: - CommandError
public enum CommandError: Error {
    case commandError(_ error: Error)
    case missingOperand
    case missingSpace
    case nonOperator
}

extension CommandError: LocalizedError {
    var description: String {
        switch self {
        case .commandError(let error):
            return "Error with \(error)"
        case .missingOperand:
            return "Missing operand(s)"
        case .missingSpace:
            return "Missing space between input/operations"
        case .nonOperator:
            return "Operator does not exist"
        }
        
    }
}

// MARK: - Command
enum Command {
    struct Main: ParsableCommand {
        static var configuration: CommandConfiguration {
            .init(commandName: "rpn",
                  abstract: "A Reverse Polish Notation Calculator",
                  version: "0.0.1"
            )
        }
    }
}
