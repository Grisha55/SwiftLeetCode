//
// 0035. Search Insert Position
// Problem: https://leetcode.com/problems/search-insert-position/
// SwiftLeetCode
//

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = -1
        var right = nums.count
        
        while left + 1 != right {
            let mid = (left + right) / 2
            if nums[mid] < target {
                left = mid
            } else {
                right = mid
            }
        }
        return right
    }
}
