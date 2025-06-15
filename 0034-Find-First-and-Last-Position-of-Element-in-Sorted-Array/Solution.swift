//
// 0034. Find First and Last Position of Element in Sorted Array
// Problem: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
// SwiftLeetCode
//

import Foundation

class Solution {

    func lhs(nums: [Int], target: Int) -> Int {
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
        if nums[right] != target { return -1 }
        return right
    }

    func rhs(nums: [Int], target: Int) -> Int {
        var left = 0
        var right = nums.count

        while left + 1 != right {
            let mid = (left + right) / 2
            if nums[mid] > target {
                right = mid
            } else {
                left = mid
            }
        }
        if nums[left] != target { return -1 }
        return left
    }

    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 { return [-1, -1] }
        return [lhs(nums: nums, target: target), rhs(nums: nums, target: target)]
    }
}
