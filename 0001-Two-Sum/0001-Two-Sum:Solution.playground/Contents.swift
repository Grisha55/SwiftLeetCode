import Foundation

// 0001-Two-Sum
// Problem: https://leetcode.com/problems/two-sum/

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]() // dictionary for storing a number and its index
    for (index, num) in nums.enumerated() {
        let comp = target - num
        if let complementIndex = dict[comp] {
            return [complementIndex, index]
        }
        dict[num] = index
    }
    return []
}

// Tests:
let nums = [2, 7, 11, 15]
let target = 9
twoSum(nums, target)


