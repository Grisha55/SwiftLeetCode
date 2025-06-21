//
// 1480. Running Sum of 1d Array
// Problem: https://leetcode.com/problems/running-sum-of-1d-array/
// SwiftLeetCode
//

import Foundation

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var result = nums

        for i in 1..<nums.count {
            result[i] = result[i - 1] + result[i]
        }

        return result
    }
}
