//
// 0714. Best Time to Buy and Sell Stock with Transaction Fee
// Problem: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count //Get the number of days
        if n == 0 { return 0 } //Handle empty input

        var hold = -prices[0] // Initialize 'hold' to the negative of the price on day 0. This represents the profit (or loss) if we bought on day 0.
        var cash = 0 // Initialize 'cash' to 0. This represents the profit if we don't hold any stock.

        // Iterate through the prices, starting from the second day.
        for i in 1..<n {
            let prevHold = hold //Store previous values to avoid overwriting before using them in calculations
            let prevCash = cash

            //Update the 'hold' variable: The maximum profit if holding a stock on day i is either the profit from holding on the previous day or the profit from selling on the previous day and buying on day i.
            hold = max(prevHold, prevCash - prices[i]) // either keep holding, or buy today

            //Update the 'cash' variable: The maximum profit if not holding a stock on day i is either the profit from not holding on the previous day or the profit from selling the stock on day i (after paying the fee).
            cash = max(prevCash, prevHold + prices[i] - fee) // either keep not holding, or sell today
        }

        //The maximum profit at the end is the profit without holding any stock (cash).
        return cash
    }
}

/*
Explanation in Simple Terms:

The algorithm maintains two variables: `hold` (representing the maximum profit if you currently hold a stock) and `cash` (representing the maximum profit if you don't currently hold a stock).

It iterates through the stock prices. For each day:

* It updates `hold` to be the maximum of either keeping the stock (the previous `hold` value) or buying the stock today (the previous `cash` minus the current price).

* It updates `cash` to be the maximum of either not having a stock (the previous `cash` value) or selling the stock today (the previous `hold` plus the current price minus the transaction fee).

Finally, the maximum profit is the value of `cash` after iterating through all the days. This approach cleverly avoids exploring all possible buy/sell combinations, making it efficient. The time complexity is O(n), and the space complexity is O(1) because it only uses a few variables.
*/
