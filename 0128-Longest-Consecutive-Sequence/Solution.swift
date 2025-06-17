//
// 0128. Longest Consecutive Sequence
// Problem: https://leetcode.com/problems/longest-consecutive-sequence/
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {

        // Translate the array into a set (Set) so that we can check for O(1) whether there is a number in the array.
        // And automaticaly deliting duplicates
        var numsSet = Set(nums)
        var longest = 0 // max sequence lenght

        for num in numsSet {

            // If num - 1 is not in Set, then num is the first element of the sequence (for example, 1 in 1,2,3,4)
            // If num - 1 is in Set, it means that it is the middle and we skip it to avoid counting the same chain several times.
            if !numsSet.contains(num - 1) {

                // Cound the length of current sequence
                var currentNum = num
                var currentStreak = 1

                // While next numbre there's in Set increase the length of the sequence.
                while numsSet.contains(currentNum + 1) {
                    currentNum += 1
                    currentStreak += 1
                }

                // Update the maximum
                longest = max(longest, currentStreak)
            }
        }
        return longest
    }
}
