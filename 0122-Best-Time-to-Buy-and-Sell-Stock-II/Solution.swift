//
// 0122. Best Time to Buy and Sell Stock II
// Problem: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0 // maximum profit
        
        for i in 1..<prices.count {
            // we compare the current element with the previous element and if current > prev:
            if prices[i] > prices[i - 1] {
                // We add it to profit
                profit += prices[i] - prices[i - 1]
            }
        }
        
        return profit
    }
}
