//
//  0015. 3Sum
//  Problem: https://leetcode.com/problems/3sum/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()  // Sort the array
        let n = sortedNums.count
        var answer: [[Int]] = []

        // Go through each element, fixing the first element of the triplet
        for i in 0..<n - 2 {
            // Skip identical values to avoid duplicates
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }

            var left = i + 1             // Left pointer
            var right = n - 1            // Right pointer

            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]

                if sum == 0 {
                    // Triple was found
                    answer.append([sortedNums[i], sortedNums[left], sortedNums[right]])

                    // Skip duplicates from left and right
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }
                    while left < right && sortedNums[right] == sortedNums[right - 1] {
                        right -= 1
                    }

                    // Shift pointers after adding a triple
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    // Amount less than zero - increase left
                    left += 1
                } else {
                    // Amount greater than zero - reduce right
                    right -= 1
                }
            }
        }

        return answer
    }
}

