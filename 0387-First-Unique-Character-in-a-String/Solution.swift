//
// 0387. First Unique Character in a String
// Problem: https://leetcode.com/problems/first-unique-character-in-a-string/
// SwiftLeetCode
//

import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        // Dictionary to store the frequency of each character
        var dict: [Character:Int] = [:]

        // First pass: count occurrences of each character
        for char in s {
            dict[char, default: 0] += 1
        }

        // Second pass: find the first character with frequency == 1
        for (index, char) in s.enumerated() {
            if dict[char] == 1 {
                return index // Return the index of the first unique character
            }
        }

        // If there is no unique character, return -1
        return -1
    }
}

/*
📌 Solution idea:
1. Count the number of each character using a dictionary.
2. Repeat the string - as soon as we find a character with a quantity of 1, return its index.
*/
