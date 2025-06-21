//
// 0790. Domino and Tromino Tiling
// Problem: https://leetcode.com/problems/domino-and-tromino-tiling/
// SwiftLeetCode
//

import Foundation

class Solution {
    func numTilings(_ n: Int) -> Int {
        let mod = 1_000_000_007 // Modulo to avoid large numbers (common in DP)

        if n == 1 { return 1 } // Base case: 2x1 has 1 way (vertical domino)
        if n == 2 { return 2 } // Base case: 2x2 has 2 ways (2 vertical or 2 horizontal)
        if n == 3 { return 5 } // Base case: 5 ways to fill 2x3 rectangle
    
        var dp = Array(repeating: 0, count: n + 1) // Initialize dp array
        dp[1] = 1 // 1 way to fill 2x1
        dp[2] = 2 // 2 ways to fill 2x2
        dp[3] = 5 // 5 ways to fill 2x3
    
        for i in 4...n {
            // Calculate dp[i] using recurrence relation
            dp[i] = (2 * dp[i - 1] % mod + dp[i - 3]) % mod
        }
    
        return dp[n] // Return total ways for 2×n
    }
}

/*
🧠 Solution idea:
Use dynamic programming:

Let dp[i] be the number of ways to tile a 2×i rectangle.

Use the recurrence formula:

dp[i] = 2 * dp[i-1] + dp[i-3]
Why:

2 * dp[i-1]: two basic expansion options from the previous state

dp[i-3]: to add trominos (Z-shaped shapes) that span 3 columns

The result is taken modulo 1_000_000_007 to avoid overflow.


📌 Conclusion:
The algorithm builds the dp table from the bottom up.

It efficiently processes each value from 4 to n.

Uses the previous values ​​in dp to calculate the next one.

Running time: O(n)

Memory: O(n) (can be improved to O(1) if you only store the last 3 values)
*/
