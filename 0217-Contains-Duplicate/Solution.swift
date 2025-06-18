//
// 0217. Contains Duplicate
// Problem: https://leetcode.com/problems/contains-duplicate/
// SwiftLeetCode
//

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        
        // In sorted arrays duplicates will be near in array
        var sortedNums = nums.sorted()

        for i in 1..<sortedNums.count {
            if sortedNums[i] == sortedNums[i - 1] {
                return true
            }
        }

        return false
    }
}
