//
// 0027. Remove Element
// Problem: https://leetcode.com/problems/remove-element/
// SwiftLeetCode

import Foundation

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var idx = 0
        for i in 0..<nums.count {
            if nums[i] != val {
                nums[idx] = nums[i]
                idx += 1
            }
        }
        return idx
    }
}
