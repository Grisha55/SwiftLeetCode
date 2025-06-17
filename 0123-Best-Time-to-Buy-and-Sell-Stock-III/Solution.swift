//
// 0123. Best Time to Buy and Sell Stock III
// Problem: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty { return 0 } // if prices are empty - profit is zero
        let n = prices.count

        var leftPath = Array(repeating: 0, count: n)  // maximum profit from one deal on the interval from 0 to i
        var rightPath = Array(repeating: 0, count: n) // maximum profit from one deal on the interval from i to the end

        // The calculation of leftPath is from left to right:
        var minPrice = prices[0]
        for i in 1..<n {
            minPrice = min(minPrice, prices[i]) // We memorize the minimum price in the current segment.

            // For each point i, we consider the best possible profit if we buy at the minimum price and sell at i.
            leftPath[i] = max(leftPath[i - 1], prices[i] - minPrice)
        }

        // The calculation of rightPath is from right to left:
        var maxPrice = prices[n - 1]
        for i in stride(from: n - 2, through: 0, by: -1) {
            maxPrice = max(maxPrice, prices[i]) // We memorize the maximum price in the current segment.
            rightPath[i] = max(rightPath[i + 1], maxPrice - prices[i]) // maximum profit from one deal on the segment from i to the end.
        }

        // Calculating the total maximum profit:
        var maxProfit = 0
        for i in 0..<n {

            // At each point i, we “split” two trades: the first before i, the second after i.
            // Summarize profits leftPath[i] + rightPath[i] and look for the maximum.
            maxProfit = max(maxProfit, leftPath[i] + rightPath[i])
        }

        return maxProfit
    }

    /*
        SIMPLE EXPLANATION:
        1. We count the best profit before each point.
        2. And we count the best profit after each point.
        3. Then in each position we add up both profits and find the maximum.
        4. This effectively finds the maximum from two trades (or one, if it's more profitable).
    */
}
