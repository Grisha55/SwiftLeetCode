//
// 0167. Two Sum II - Input Array Is Sorted
// Problem: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
// SwiftLeetCode
//

import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var l = 0                 // left pointer
        var r = numbers.count - 1 // right pointer

        while l < r {
            let sum = numbers[l] + numbers[r]

            if sum == target {
                return [l + 1, r + 1]
            } else if sum < target {
                l += 1
            } else {
                r -= 1
            }
        }

        return []
    }
}
