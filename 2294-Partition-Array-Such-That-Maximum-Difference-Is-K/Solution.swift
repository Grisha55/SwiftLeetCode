//
// 2294. Partion Array Such That Maximum Difference Is K
// Problem: https://leetcode.com/problems/partition-array-such-that-maximum-difference-is-k/?envType=daily-question&envId=2025-06-19
// SwiftLeetCode
//

import Foundation

class Solution {
    func partitionArray(_ nums: [Int], _ k: Int) -> Int {
        var count = 1 // number of subsequences
        var sortedNums = nums.sorted() // First, we sort the array in ascending order. This is necessary so that numbers that are close in value are next to each other. This makes it easier to collect groups.

        var start = sortedNums[0] // first number of current group
        
        for num in sortedNums {

            // If the current number num differs greatly from start (that is, num - start > k),
            // then this number no longer fits into the current group.
            if num - start > k {
                count += 1
                start = num // current number is start of the new group
            }
        }

        return count
    }
}
