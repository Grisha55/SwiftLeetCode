//
// 0309. Best Time to Buy and Sell Stock with Cooldown
// Problem: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {

        // If there are no prices, no profit can be made.
        if prices.isEmpty { return 0 }

        // Initialize variables to track states:
        var hold = -prices[0]      // // Profit if we hold a stock (initially, we buy at the first price)
        var sold = 0               // // Profit if we've sold a stock (initially, we haven't sold)
        var rest = 0               // // Profit if we're resting (haven't bought or sold today)

        // Iterate through the prices from the second day onward.
        for i in 1..<prices.count {

            // Store previous day's sold profit.
            let prevSold = sold

            // Calculate the profit if we sell today: the profit from holding + the current price.
            sold = hold + prices[i]

            // Calculate the profit if we buy today: we only buy if we were resting yesterday. Take the max profit between holding and buying today.
            hold = max(hold, rest - prices[i])

            // Calculate the profit if we rest today: either we rest (keep yesterday's rest profit) or we sell and rest. We take the max
            rest = max(rest, prevSold)
        }

        // At the end, we can't be holding a stock, so we return the maximum profit between selling and resting.
        return max(sold, rest)
    }

}
