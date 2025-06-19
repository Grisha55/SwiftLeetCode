//
// 0242. Valid Anagram
// Problem: https://leetcode.com/problems/valid-anagram/
// SwiftLeetCode
//

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {

        // If lengths are not equal, they can't be anagrams
        if s.count != t.count {
            return false
        }

        // Create a fixed-size array to count letters (26 letters in the alphabet)
        var count: [Int] = Array(repeating: 0, count: 26)

        // Count each character in the first string
        for c in s {
            let cValue = Int(c.asciiValue!) // Get ASCII value of character
            let aValue = Int(Character("a").asciiValue!) // Get ASCII value of 'a'
            count[cValue - aValue] += 1 // Map character to index and increment
        }

        // Subtract the counts using the second string
        for c in t {
            let cValue = Int(c.asciiValue!) // Get ASCII value of character
            let aValue = Int(Character("a").asciiValue!) // Get ASCII value of 'a'
            if count[cValue - aValue] == 0 { // If count is zero, more occurrences than in s
                return false
            }
            count[cValue - aValue] -= 1 // Decrease count for this character
        }

        // If all counts are balanced, it's an anagram
        return true
    }
}
