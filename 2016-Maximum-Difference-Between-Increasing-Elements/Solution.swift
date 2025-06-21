//
// 2016. Maximum Difference Between Increasing Elements
// Problem: https://leetcode.com/problems/maximum-difference-between-increasing-elements/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var lastMin = nums[0]
        var maxDif = -1

        for i in 1..<nums.count {
            if nums[i] > lastMin {
                maxDif = max(maxDif, nums[i] - lastMin)
            } else {
                lastMin = nums[i]
            }
        }
        return maxDif
    }
}
