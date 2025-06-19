//
// 0279. Perfect Squares
// Problem: https://leetcode.com/problems/perfect-squares/
// SwiftLeetCode
//

import Foundation

/*
🔧 How the code works:
    1. We create an array dp, where dp[i] will be the minimum number of squares to get the sum i.
    2. We start with dp[0] = 0 (no numbers are needed to get 0).
    3. For each number from 1 to n:
        - Iterate over all squares j*j that are less than or equal to the current number.
        - Check if we can use the square j*j and improve the value of dp[i].
        - Remember the minimum number of squares for each sum.
    4. Return dp[n] — this is the minimum number of squares for the number n.
*/

class Solution {
    func numSquares(_ n: Int) -> Int {
        // Create a DP array of size n+1, filled with maximum Int values
        var dp = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0 // Base case: 0 can be represented with 0 squares

        // Iterate over all numbers from 1 to n
        for i in 1...n {
            var j = 1

            // Try every square number less than or equal to i
            while j * j <= i {

                // Update dp[i] by choosing the minimum between current and using square j*j
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                j += 1
            }
        }

        // Return the minimum number of squares needed to sum to n
        return dp[n]
    }
}

/*
💡 What this code does:
It iterates over all possible squares of numbers (1, 4, 9, 16, …), and looks for the smallest number of such squares whose sum will give the number n.
It is based on dynamic programming - we build the solution from the bottom up, starting from 0 and moving to n, remembering the minimum values ​​at each step.

If you want, I can draw a diagram or explain with a specific example (for example, n = 13).
*/
