//
// 0121. Best Time to Buy and Sell Stock
// Problem:
// SwiftLeetCode

import Foundation

class Solution {
func maxProfit(_ prices: [Int]) -> Int {
    var result = 0 // the maximum profit obtained.
    var minNum = prices[0] // the minimum share price encountered up to the current moment.
    
    for i in 1..<prices.count {
        if minNum > prices[i] { // If the current price is less than the minimum price
            minNum = prices[i]  // then `minNum` is updated to the current price.
        }

        // This calculates the potential profit from selling a stock at the current price (`prices[i]`)         after buying it at the minimum price (minNum).
        if result < prices[i] - minNum { //  If this potential profit is greater than the current maximum  profit (result)
            result = prices[i] - minNum // then `result` is updated.
        }
    }
    
        return result
    }
}
