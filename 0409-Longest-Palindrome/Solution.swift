//
// 0409. Longest Palindrome
// Problem: https://leetcode.com/problems/longest-palindrome/
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        // Dictionary to count occurrences of each character
        var charCount: [Character: Int] = [:]
    
        // Variable to store the total length of the palindrome
        var length = 0
    
        // Flag to check if there is at least one odd-count character
        var hasOdd = false

        // Count how many times each character appears in the string
        for c in s {
            charCount[c, default: 0] += 1
        }

        // Go through each character count
        for count in charCount.values {
            if count % 2 == 0 {
                // If even, we can use all characters
                length += count
            } else {
                // If odd, use the largest even part (e.g., 5 -> 4)
                length += count - 1
                // Mark that we have at least one odd character
                hasOdd = true
            }
        }

        // If there was any odd count, we can add one more character in the middle
        if hasOdd {
            length += 1
        }

        // Return the final length of the longest possible palindrome
        return length
    }

}

/*
🧠 Simple explanation:
    1. We count how many times each letter appears in the string.
    2. If a letter appears an even number of times, all its occurrences can be used.
    3. If a letter appears an odd number of times, only an even number can be used (e.g. 4 out of 5 letters), and one letter can be left in the center of the palindrome.
    4. If there is at least one letter with an odd number, we can add one letter to the center of the palindrome.

✅ Example:
For the string "abccccdd":

a: 1 time
b: 1 time
c: 4 times
d: 2 times

We can use:
c (4) + d (2) + a or b (1) = palindrome length 7 (e.g. "dccaccd").
*/
