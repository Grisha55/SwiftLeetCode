//
// 0516. Longest Palindromic Subsequence
// Problem: https://leetcode.com/problems/longest-palindromic-subsequence/
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        // Convert the string to an array of characters for easier access.
        var a = Array(s)
        var n = a.count // Get the length of the string

        //Handle base cases: empty or single-character string.
        if n == 0 { return 0 } // Empty string, no subsequence.
        if n == 1 { return 1 } // Single character is a palindrome of length 1.
        
        // dp[i][j] will store the length of the longest palindromic subsequence in the substring s[i...j].
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        // Base case: single-character substrings are palindromes of length 1.
        for i in 0..<n {
            dp[i][i] = 1
        }

        // Iterate through substring lengths from 2 to n.
        for len in 2...n {
            // Iterate through possible starting indices i.
            for i in 0...(n - len) {
                // Calculate the ending index j for the current substring.
                let j = i + len - 1
                // If the characters at the beginning and end of the substring match...
                if a[i] == a[j] {
                    // If the substring has length 2, it's a palindrome of length 2.
                    if len == 2 {
                        dp[i][j] = 2
                    } else {
                        // Otherwise, the length of the longest palindromic subsequence
                        // is the length of the longest palindromic subsequence in the
                        // inner substring (excluding the matching ends) plus 2 (for the ends).
                        dp[i][j] = dp[i + 1][j - 1] + 2
                    }
                } else {
                    // If the characters don't match, the length of the longest palindromic
                    // subsequence is the maximum of the lengths of the longest palindromic
                    // subsequences in the two substrings obtained by excluding either
                    // the beginning or the end character.
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
        }

        // The result is stored in dp[0][n-1], which represents the longest palindromic
        // subsequence in the entire string.
        return dp[0][n - 1]
    }
}

/*
Explanation in Simple Terms:

The function uses dynamic programming. It builds up a table (`dp`) where `dp[i][j]` stores the length of the longest palindromic subsequence within the substring from index `i` to `j`.

It starts with the base cases: single-character substrings are palindromes of length 1. Then, it iteratively considers substrings of increasing length. If the first and last characters of a substring match, it means those characters can be part of a palindromic subsequence. The length is then the length of the inner substring (excluding the matching ends) plus 2. If the first and last characters don't match, the longest palindromic subsequence is the longer of the subsequences found by excluding either the first or last character. The final answer is in `dp[0][n-1]`.


The time complexity is O(n^2) due to the nested loops, and the space complexity is also O(n^2) due to the `dp` table. It's an efficient algorithm for solving this problem.
*/
