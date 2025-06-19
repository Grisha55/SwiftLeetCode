//
// 0232. Implement Queue using Stacks
// Problem: https://leetcode.com/problems/implement-queue-using-stacks/
// SwiftLeetCode
//

import Foundation

class MyQueue {
    private var inputStack: [Int] = []  // This is where we add new elements.
    private var outputStack: [Int] = [] // from here we extract the elements in the correct order (according to the queue principle).

    init() {}
    
    // Add an element to the end of the queue
    func push(_ x: Int) {
        inputStack.append(x)
    }
    
    // Remove an element from the front of the queue and return it
    func pop() -> Int {
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.removeLast()
    }
    
    // Return the first element of the queue without removing it
    func peek() -> Int {
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.last!
    }
    
    // Checking if the queue is empty
    func empty() -> Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }

    /*
        🔍 Explanation:
        A stack is a data structure where elements are added and removed only from the end (LIFO - last in, first out).
        To make a queue (FIFO) behavior, we use two stacks:
            - inputStack: here we add new elements.
            - outputStack: from here we extract elements in the correct order (queue-like).

        When we need to remove an element (pop) or look at the front (peek), and the outputStack is empty, we move all elements    from the inputStack to the outputStack.
        This reverses the order, and the first added element ends up on top.
    */
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
