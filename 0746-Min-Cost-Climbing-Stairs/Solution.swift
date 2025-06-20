//
// 0746. Min Cost Climbing Stairs
// Problem: https://leetcode.com/problems/min-cost-climbing-stairs/
// SwiftLeetCode
//

import Foundation

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        //Create a DP array to store the minimum cost to reach each step. We add one extra element to represent the top of the stairs (which has no cost).
        var dp = Array(repeating: 0, count: cost.count + 1)

        // Iterate through the cost array, starting from the second step (index 2).
        for i in 2...cost.count {
            //To reach step 'i', we can either come from step 'i-1' or step 'i-2'.
            //Calculate the minimum cost to reach step 'i' by adding the cost of the current step to the minimum cost from the previous step or the step before that.
            dp[i] = min(dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2])
        }

        //The minimum cost to reach the top of the stairs is stored at the last index of the dp array.
        return dp[cost.count]
    }
}

/*
Explanation in Simple Terms:

The function uses dynamic programming. `dp[i]` stores the minimum cost to reach step `i`. To reach step `i`, you can either come from step `i-1` or step `i-2`. Therefore, the minimum cost to reach step `i` is the minimum of:

1. The cost to reach step `i-1` plus the cost of step `i-1` (`dp[i-1] + cost[i-1]`).
2. The cost to reach step `i-2` plus the cost of step `i-2` (`dp[i-2] + cost[i-2]`).

The function iterates through the steps, calculating the minimum cost for each step using this approach. The final result (`dp[cost.count]`) is the minimum cost to reach the top of the stairs (which is considered to be one step beyond the last step in the `cost` array).


The time complexity is O(n), where n is the number of steps, and the space complexity is O(n) to store the `dp` array. However, since we only need the last two values of `dp` at any given time, the space complexity can be optimized to O(1) by using only two variables instead of the entire array.
*/
