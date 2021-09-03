//
//  Stack.swift
//  
//
//  Created by Paul Thi on 9/2/21.
//

import Foundation

// MARK: - Stackable
protocol Stackable {
    associatedtype Element
    func peek() -> Element?
    mutating func push(_ element: Element)
    @discardableResult mutating func pop() -> Element?
}

extension Stackable {
    var isEmpty: Bool { peek() == nil }
}


// MARK: - Stack
struct Stack<Element>: Stackable where Element: Equatable {
    private var storage = [Element]()
    func peek() -> Element? { storage.last }
    mutating func push(_ element: Element) {
        count += 1
        storage.append(element)
    }
    mutating func pop() -> Element? {
        count -= 1
        return storage.popLast()
    }
    var count = 0
}

// MARK: - Equatable
extension Stack: Equatable {
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool { lhs.storage == rhs.storage }
}

// MARK: - CustomStringConvertible
extension Stack: CustomStringConvertible {
    var description: String { "\(storage)" }
}
    
// MARK: - ExpressibleByArrayLiteral
extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Self.Element...) { storage = elements }
}
