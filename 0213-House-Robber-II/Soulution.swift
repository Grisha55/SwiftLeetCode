//
// 0213. House Robber
// Problem: https://leetcode.com/problems/house-robber-ii/
// SwiftLeetCode
//

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 } // if there are no houses -> return 0
        if nums.count == 1 { return nums[0] } // if there is only one house -> rob it
        
        func robLinear(_ nums: [Int]) -> Int {
            var prev1 = 0 // maximum, if the current house is not robbed.
            var prev2 = 0 // maximum, if the previous house was not robbed, but we want to rob the current one.
        
            for money in nums {
                let temp = prev1
                prev1 = max(prev2 + money, prev1)
                prev2 = temp
            }

            return prev1
        }

        let rob1 = robLinear(Array(nums[0..<nums.count - 1])) // rob houses from the 2nd to the second to last (skip the last one).
        let rob2 = robLinear(Array(nums[1..<nums.count]))     // rob houses from the 2nd to the last (skip the first one).

        return max(rob1, rob2) // take the best option of the two.
    }
}
