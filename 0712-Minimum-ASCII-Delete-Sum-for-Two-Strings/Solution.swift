//
// 0712. Minimum ASCII Delete Sum for Two Strings
// Problem: https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/
// SwiftLeetCode
//

import Foundation

class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        // Convert strings to arrays of characters for easier access.
        let a = Array(s1)
        let b = Array(s2)
        // Get lengths of the strings.
        let n = a.count
        let m = b.count
    
        // Initialize a DP table. dp[i][j] will store the minimum sum of deletions to make the first i characters of s1 and the first j characters of s2 equal.
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    
        // Base case: If s2 is empty, we need to delete all characters from s1.
        for i in 1...n {
            dp[i][0] = dp[i - 1][0] + Int(a[i - 1].asciiValue!) // Add ASCII value of the character to the previous sum.
        }
    
        // Base case: If s1 is empty, we need to delete all characters from s2.
        for j in 1...m {
            dp[0][j] = dp[0][j - 1] + Int(b[j - 1].asciiValue!) // Add ASCII value of the character to the previous sum.
        }
    
        // Main DP loop.
        for i in 1...n {
            for j in 1...m {
                // If characters match, no deletion is needed.
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] // Take the value from the diagonal.
                } else {
                    // Otherwise, we need to delete either the character from s1 or s2, choosing the option that minimizes the sum.
                    dp[i][j] = min(
                        dp[i - 1][j] + Int(a[i - 1].asciiValue!), // Delete from s1.
                        dp[i][j - 1] + Int(b[j - 1].asciiValue!) // Delete from s2.
                    )
                }
            }
        }
    
        // The final result is stored in dp[n][m].
        return dp[n][m]
    }

}

/*
Explanation in Simple Terms:

The function uses dynamic programming to build a table (`dp`) where `dp[i][j]` represents the minimum sum of ASCII values of characters that need to be deleted to make the first `i` characters of `s1` equal to the first `j` characters of `s2`.

It starts by initializing the first row and column of the table to handle the base cases where one string is empty. Then, it iterates through the table. If the characters at the current positions in both strings match, no deletion is needed, and the value is taken from the diagonal. If they don't match, it chooses the minimum between deleting the character from `s1` or `s2` (adding its ASCII value to the minimum deletion sum from the previous step). The final result is the value in the bottom-right cell of the table.


The time complexity is O(n*m), where n and m are the lengths of the strings, due to the nested loops. The space complexity is O(n*m) to store the DP table.
*/
