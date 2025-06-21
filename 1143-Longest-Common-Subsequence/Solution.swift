//
// 1143. Longest Common Subsequence
// Problem: https://leetcode.com/problems/longest-common-subsequence/
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        // Convert strings to arrays of characters for easier processing.
        var arr1 = Array(text1)
        var arr2 = Array(text2)
        // Get lengths of the strings.
        let m = arr1.count
        let n = arr2.count

        // Initialize a DP table. dp[i][j] will store the length of the LCS of the first i characters of arr1 and the first j characters of arr2. We add an extra row and column to handle base cases.
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        // Iterate through the characters of both strings.
        for i in 1...m {
            for j in 1...n {
                //If the characters match...
                if arr1[i - 1] == arr2[j - 1] {
                    //The length of the LCS is incremented by 1 (we found a common character). The value is taken from the diagonal element in the DP table.
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    //If characters don't match, the length of the LCS is the maximum of the LCS lengths from the cell above and the cell to the left.
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }

        // The length of the LCS of the entire strings is stored in the bottom-right cell of the DP table.
        return dp[m][n]
    }
}

/*
Explanation in Simple Terms:

The function uses dynamic programming to build a table (`dp`) where `dp[i][j]` represents the length of the longest common subsequence between the first `i` characters of `text1` and the first `j` characters of `text2`.

It initializes the table with zeros. Then, it iterates through the characters of both strings. If the characters at the current positions match, it means we've found a common character, so we increment the LCS length by 1 (taking the value from the diagonal element in the table and adding 1). If the characters don't match, the LCS length is the maximum of the LCS lengths from the cell above and the cell to the left (because we can either exclude the character from `text1` or `text2`).

Finally, the length of the LCS of the entire strings is stored in the bottom-right cell of the table.


The time complexity is O(m*n), where m and n are the lengths of the input strings, due to the nested loops. The space complexity is O(m*n) to store the DP table. This space complexity could be optimized to O(min(m, n)) by using only a 1D or 2D array with smaller dimensions.
*/
