//
// 0188. Best Time to Buy and Sell Stock IV
// Problem: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        if n == 0 || k == 0 { return 0 }

        // Part 1: Fast processing if k is very large
        // The simple case is that if k is greater than or equal to n / 2, then you can make as many trades as you want.
        if k >= n / 2 {
            var profit = 0
            for i in 1..<n {

                // We just take all the price rises and add them up - that would be the maximum.
                if prices[i] > prices[i - 1] {
                    profit += prices[i] - prices[i - 1]
                }
            }

            return profit
        }

        // Part 2: Basic Logic - Dynamic Programming

        // dp[t][i] - the maximum profit that can be obtained up to and including day i by making no more than t transactions.
        var dp = Array(repeating: Array(repeating: 0, count: n), count: k + 1)

        for t in 1...k {
            var maxDiff = -prices[0]
            for i in 1..<n {

                // dp[t][i] = max of:
                    // - don't make a deal today → dp[t][i - 1]
                    // - sell today → prices[i] + maxDiff
                dp[t][i] = max(dp[t][i - 1], prices[i] + maxDiff)

                // Every time we want to sell a stock on day i, we look for:
                // max of: "profit from previous deal - purchase price"
                maxDiff = max(maxDiff, dp[t - 1][i] - prices[i])
            }
        }

        // The value in the lower right corner of the table is the answer: the maximum profit for k trades until the last day.
        return dp[k][n - 1]
    }
}
