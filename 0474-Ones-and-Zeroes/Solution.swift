//
// 0474. Ones and Zeroes
// Problem: https://leetcode.com/problems/ones-and-zeroes/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        // Create a 2D DP array. dp[i][j] will store the maximum number of strings
        // that can be formed using at most 'i' zeros and 'j' ones.
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        // Iterate through each string in the input array.
        for str in strs {
            // Count the number of zeros and ones in the current string.
            var zeros = 0
            var ones = 0

            for char in str {
                if char == "0" {
                    zeros += 1
                } else {
                    ones += 1
                }
            }

            // Update the DP array. We iterate backwards to avoid double-counting.
            for i in stride(from: m, through: zeros, by: -1) {
                // Iterate through possible numbers of zeros
                for j in stride(from: n, through: ones, by: -1) {
                    // Iterate through possible numbers of ones
                    // If we have enough zeros and ones to include the current string,
                    // update the DP array. We take the maximum of the current value and
                    // the value obtained by including the current string (adding 1).
                    dp[i][j] = max(dp[i][j], dp[i - zeros][j - ones] + 1)
                }
            }
        }

        // The final result is stored at dp[m][n], representing the maximum number of strings
        // that can be formed using at most 'm' zeros and 'n' ones.
        return dp[m][n]
    }

}

/*
Explanation in Simple Terms:

The function uses dynamic programming. Imagine a table (`dp`) where each cell `dp[i][j]` represents the maximum number of strings you can create using at most `i` zeros and `j` ones.

The algorithm iterates through each string:

1. Count Zeros and Ones: It counts the number of zeros and ones in the current string.

2. Update DP Table: It then updates the `dp` table. For each cell `dp[i][j]`, it checks if including the current string is possible (do we have enough zeros (`i`) and ones (`j`)?). If it is, it considers two possibilities:
   - Don't include the string: Keep the existing value of `dp[i][j]`.
   - Include the string: This adds 1 to the count, but we need to use `dp[i - zeros][j - ones]` because we've used `zeros` and `ones` from the current string. We take the maximum of these two possibilities.

3. Final Result: After processing all strings, `dp[m][n]` contains the maximum number of strings that can be formed using at most `m` zeros and `n` ones, which is the function's return value. The backward iteration in the inner loops prevents double-counting of strings.


The time complexity is O(m*n*L), where L is the total length of all strings, due to the nested loops. The space complexity is O(m*n) due to the DP table. It's an efficient solution for this type of combinatorial optimization problem.
*/
