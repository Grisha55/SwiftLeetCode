//
// 3170. Lexicographically Minimum String After Removing Stars
// Problem: https://leetcode.com/problems/lexicographically-minimum-string-after-removing-stars/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func clearStars(_ s: String) -> String {
        var stacks: [[Int]] = Array(repeating: [], count: 26) // Array of stacks to track character indices (one stack per letter)
        var sArray = Array(s) // Convert string to array for efficient modification

        for (i, char) in sArray.enumerated() { // Iterate through the string
            if char != "*" { // If it's a letter
                let index = Int(char.asciiValue! - Character("a").asciiValue!) // Get the letter's index (a=0, b=1, etc.)
                stacks[index].append(i) // Push the index onto the corresponding stack
            } else { // If it's an asterisk
                for j in 0..<26 { // Iterate through all letters
                    if !stacks[j].isEmpty { // If there's a letter to remove
                        let indexToRemove = stacks[j].removeLast() // Pop the last index from the stack
                        sArray[indexToRemove] = "*" // Mark the character as removed
                        break // Only remove one character per asterisk
                    }
                }
            }
        }

        // Reconstruct the string, omitting removed characters ('*').
        var result = ""
        for char in sArray {
            if char != "*" {
                result.append(char)
            }
        }
        return result
    }
}

/*
Explanation in Simple Terms:

It uses an array of arrays (acting as stacks) to keep track of the indices of each letter. When an asterisk is encountered, it removes the most recently added letter (using `removeLast()`), effectively simulating the "erasing" process. Finally, it reconstructs the string, excluding the characters marked for removal. This approach maintains the original order of characters while accurately handling the asterisk removals. The time complexity is O(n), and space complexity is O(n) in the worst case (where all characters are distinct).
*/
