//
// 0155. Min Stack
// Problem: https://leetcode.com/problems/min-stack/
// SwiftLeetCode
//

import Foundation

class MinStack {
    private var stack: [Int] = []    // The main stack for storing all elements.
    private var minStack: [Int] = [] // Auxiliary stack. It stores the current minimum element at each step.
    
    // When we add an item to `stack`, we check if it is smaller than the current minimum in `minStack`.
    // If so, we add it to `minStack`.
    func push(_ val: Int) {
        stack.append(val)
        if minStack.isEmpty || val <= minStack.last! {
            minStack.append(val)
        }
    }
    
    // Deletes the last element from `stack`. If the deleted item matches the last item in `minStack`,
    // it means it was minimal, so we remove it from `minStack` too.
    func pop() {
        if !stack.isEmpty {
            let poppedValue = stack.removeLast()
            if poppedValue == minStack.last! {
                minStack.removeLast()
            }
        }
    }
    
    // Return the last element in stack
    func top() -> Int {
        return stack.last ?? -1
    }
    
    // Return the last element in minStack (current minimum)
    func getMin() -> Int {
        return minStack.last ?? -1
    }

    /*
        All operations (`push`, `pop`, `top`, `getMin`) are performed in O(1) time
        because the last stack element is accessed in constant time.
    */
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
