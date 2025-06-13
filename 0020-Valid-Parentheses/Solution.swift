// 0020-Valid-Parentheses
// Problem: https://leetcode.com/problems/valid-parentheses/

import Foundation

func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    let pairs: [Character: Character] = [")":"(", "}":"{", "]":"["]

    for char in s {
        if char == "(" || char == "[" || char == "{" {
            stack.append(char)
        } else if let expectedOpen = pairs[char] {
            if stack.isEmpty || stack.last != expectedOpen {
                return false
            }
            stack.removeLast()
        }
    }

    return stack.isEmpty
}
