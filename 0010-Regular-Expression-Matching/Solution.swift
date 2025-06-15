//
// 0010. Regular Expression Matching
// Problem: https://leetcode.com/problems/regular-expression-matching/
// SwiftLeetCode
//

import Foundation

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArray = Array(s)  // Convert input string to character array
        let pArray = Array(p)  // Convert pattern string to character array
        let m = sArray.count   // Length of the input string
        let n = pArray.count   // Length of the pattern string

        // Create a DP table with default values false
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)

        dp[0][0] = true  // Empty string matches empty pattern

        // Initialize the first row for patterns like a*, a*b*, etc.
        for j in 1...n {
            if pArray[j - 1] == "*" && j >= 2 {
                dp[0][j] = dp[0][j - 2]
            }
        }

        // Fill the DP table
        for i in 1...m {
            for j in 1...n {
                if pArray[j - 1] == "." || pArray[j - 1] == sArray[i - 1] {
                    // Match if characters are equal or pattern has '.'
                    dp[i][j] = dp[i - 1][j - 1]
                } else if pArray[j - 1] == "*" {
                    if j >= 2 {
                        // Option 1: Treat '*' and its previous character as empty
                        dp[i][j] = dp[i][j - 2]

                        // Option 2: If the preceding character matches s[i-1] or is '.'
                        if pArray[j - 2] == "." || pArray[j - 2] == sArray[i - 1] {
                            dp[i][j] = dp[i][j] || dp[i - 1][j]
                        }
                    }
                }
            }
        }

        return dp[m][n]  // Final answer whether full string matches pattern
    }
}

