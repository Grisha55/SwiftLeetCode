//
// 0704. Binary Search
// Problem: https://leetcode.com/problems/binary-search/
// SwiftLeetCode
//

import Foundation

class Solution {

    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = -1
        var right = nums.count - 1

        while left + 1 != right {
            let mid = (left + right) / 2
            if nums[mid] < target {
                left = mid
            } else {
                right = mid
            }
        }
        if nums[right] == target {
            return right
        } else {
            return -1
        }
        
    }
}
