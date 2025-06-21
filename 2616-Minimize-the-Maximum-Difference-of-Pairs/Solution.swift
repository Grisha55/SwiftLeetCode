//
// 2616. Minimize the Maximum Difference of Pairs
// Problem: https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        // Sort the numbers to easily find adjacent pairs.
        let sortedNums = nums.sorted()

        // Helper function to check if we can create at least p pairs with a given maximum difference.
        func canPair(_ maxDiff: Int) -> Bool {
            var count = 0 // Number of pairs found.
            var i = 0 // Index to iterate through the sorted numbers.

            // Iterate through the sorted numbers, looking for pairs.
            while i < sortedNums.count - 1 {
                // If the difference between adjacent numbers is less than or equal to the maxDiff...
                if sortedNums[i + 1] - sortedNums[i] <= maxDiff {
                    // ...increment the pair count and skip the next number (because we already paired it).
                    count += 1
                    i += 2
                } else {
                    // Otherwise, just move to the next number.
                    i += 1
                }
            }
            // Return true if at least p pairs were found.
            return count >= p
        }

        // Initialize the search space for binary search.
        var left = 0 // Minimum possible difference is 0.
        var right = sortedNums.last! - sortedNums.first! // Maximum possible difference.
        var result = right // Initialize result to the maximum possible difference.

        // Perform binary search.
        while left <= right {
            let mid = (left + right) / 2 // Calculate the middle difference.
            // If we can create at least p pairs with this maximum difference...
            if canPair(mid) {
                result = mid // Update the result to this difference.
                right = mid - 1 // Try to find a smaller maximum difference.
            } else {
                left = mid + 1 // Otherwise, we need a larger maximum difference.
            }
        }

        // Return the minimum maximum difference found.
        return result
    }
}

/*
Explanation in Simple Terms:

The core idea is to use binary search on the potential maximum difference between pairs. The `canPair` function checks if, given a maximum difference, we can create at least `p` pairs from the sorted array by pairing adjacent elements with differences less than or equal to that maximum. The binary search efficiently finds the smallest maximum difference that satisfies this condition. The time complexity is O(N log M), where N is the number of elements and M is the difference between the largest and smallest elements. The space complexity is O(1), excluding the space for sorting which is usually O(N) or O(N log N) depending on the sorting algorithm.
*/
