//
// 2434. Using a Robot to Print the Lexicographically Smallest String
// Problem: https://leetcode.com/problems/using-a-robot-to-print-the-lexicographically-smallest-string/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func robotWithString(_ s: String) -> String {
        let a = Array(s) // Convert the string to an array of characters for easier access.
        let n = a.count // Get the length of the string.
        var minSuffix = Array(repeating: Character("z"), count: n + 1) // Initialize an array to store the minimum character in each suffix. "z" is used as a large initial value.

        // Iterate through the string from right to left to find the minimum character in each suffix.
        for i in stride(from: n - 1, through: 0, by: -1) {
            minSuffix[i] = min(minSuffix[i + 1], a[i]) // The minimum character in suffix i is the minimum of the current character and the minimum character in the next suffix.
        }

        var stack: [Character] = [] // Create a stack to store characters temporarily.
        var result = "" // Initialize the result string.

        // Iterate through the string.
        for i in 0..<n {
            stack.append(a[i]) // Push the current character onto the stack.

            // While the stack is not empty and the last character in the stack is less than or equal to the minimum character in the remaining suffix...
            while let last = stack.last, last <= minSuffix[i + 1] {
                result.append(stack.removeLast()) // ...pop the character from the stack and append it to the result string.
            }
        }

        // After processing all characters, append any remaining characters from the stack to the result string.
        while let last = stack.last {
            result.append(stack.removeLast())
        }

        return result // Return the lexicographically smallest string.
    }
}

/*
Explanation in Simple Terms:

The algorithm uses a stack and a `minSuffix` array to efficiently find the lexicographically smallest string. `minSuffix[i]` stores the smallest character in the suffix starting at index `i`.

The algorithm iterates through the input string:

1. Push: Each character is pushed onto the stack.

2. Pop (if possible): If the top of the stack is less than or equal to the smallest character in the remaining suffix (`minSuffix[i+1]`), it means we can safely pop this character and add it to the result string because no smaller character will come later. This ensures that smaller characters are processed and added to the `result` string first.

3. Remaining characters: After processing the input string, any remaining characters in the stack are appended to the `result` string.

This approach cleverly avoids brute-force exploration of all possible character ordering, leading to a time-efficient solution. The time complexity is O(n), where n is the length of the string, as each character is processed once. The space complexity is O(n) due to the stack and `minSuffix` array.
*/
