//
// 1312. Minimum Insertion Steps to Make a String Palindrome
// Problem: https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/
// SwiftLeetCode
//

import Foundation

class Solution {
    func minInsertions(_ s: String) -> Int {
        // Convert the string into an array of characters for easier access.
        let a = Array(s)
        // Get the length of the string.
        let n = a.count
        // Handle base cases: empty or single-character strings are already palindromes.
        if n <= 1 { return 0 }
        // Initialize a DP table. dp[i][j] stores the length of the longest palindromic subsequence between indices i and j (inclusive).
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        // Base case: A single character is a palindrome of length 1.
        for i in 0..<n {
            dp[i][i] = 1
        }

        // Iterate through possible lengths of palindromic subsequences (from 2 to n).
        for l in 2...n {
            // Iterate through possible starting indices for subsequences of length l.
            for i in 0...(n - l) {
                // Calculate the ending index for the current subsequence.
                let j = i + l - 1
                // If the characters at the start and end match...
                if a[i] == a[j] {
                    // ...the length of the longest palindromic subsequence is 2 (the matching characters) plus the length of the LPS between i+1 and j-1.
                    dp[i][j] = 2 + dp[i + 1][j - 1]
                } else {
                    // ...otherwise, the length of the LPS is the maximum of the LPS between i+1 and j, and the LPS between i and j-1.
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
        }
        //The minimum number of insertions needed is the difference between the string length and the length of the longest palindromic subsequence.
        return n - dp[0][n - 1]
    }
}

/*
Explanation in Simple Terms:

The function uses dynamic programming to find the length of the longest palindromic subsequence within the given string. The minimum number of insertions needed to make the string a palindrome is equal to the difference between the string's length and the length of its longest palindromic subsequence.

The `dp` table stores the length of the longest palindromic subsequence for every substring of the input string. It fills the table bottom-up, starting with single-character substrings (which are all palindromes of length 1). For longer substrings, it checks if the first and last characters match. If they do, the length of the longest palindromic subsequence is 2 plus the length of the longest palindromic subsequence of the inner substring (excluding the first and last characters). Otherwise, it's the maximum of the longest palindromic subsequences of the substrings obtained by excluding either the first or the last character.

Finally, the function subtracts the length of the longest palindromic subsequence (found in `dp[0][n-1]`) from the total length of the string to determine the minimum number of insertions needed.


The time complexity is O(n²), where n is the length of the string, because of the nested loops. The space complexity is also O(n²) to store the DP table. The space complexity could be optimized to O(n) using a 1D DP array.
*/
