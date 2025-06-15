//
// 0005. Longest Palindromic Substring
// Problem: https://leetcode.com/problems/longest-palindromic-substring/
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        // If the input string has 0 or 1 character, it's already a palindrome
        if s.count <= 1 {
            return s
        }

        let chars = Array(s) // Convert the string to an array of characters for easy indexing
        var maxStr = String(chars[0]) // Initialize the longest palindrome with the first character

        // Helper function to expand around the center and find palindromes
        func expandFromCenter(_ left: Int, _ right: Int) -> String {
            var l = left
            var r = right

            // Expand while the characters on both sides are equal and within bounds
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                l -= 1
                r += 1
            }

            // Return the found palindrome substring
            return String(chars[(l + 1)..<r])
        }

        // Iterate through each character as the center of a potential palindrome
        for i in 0..<chars.count - 1 {
            let odd = expandFromCenter(i, i)       // Check for odd-length palindrome
            let even = expandFromCenter(i, i + 1)  // Check for even-length palindrome

            // Update the result if a longer palindrome is found
            if odd.count > maxStr.count {
                maxStr = odd
            }
            if even.count > maxStr.count {
                maxStr = even
            }
        }

        return maxStr // Return the longest palindrome found
    }
}

