//
// 0673. Number of Longest Increasing Subsequence
// Problem: https://leetcode.com/problems/number-of-longest-increasing-subsequence/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var n = nums.count //Get the size of the input array
        if n == 0 { return 0 } //Handle empty array case

        // lengths[i] stores the length of the LIS ending at index i. Initialize all to 1 (a single element is an LIS of length 1).
        var lengths = Array(repeating: 1, count: n)
        // counts[i] stores the number of LIS of the length stored in lengths[i], ending at index i. Initialize all to 1 (one way to have an LIS of length 1).
        var counts = Array(repeating: 1, count: n)

        // Iterate through each number in the array.
        for i in 0..<n {
            // Iterate through the numbers before the current number.
            for j in 0..<i {
                // If the current number is greater than the previous number...
                if nums[j] < nums[i] {
                    // If extending the LIS ending at j would create a longer LIS ending at i...
                    if lengths[j] + 1 > lengths[i] {
                        // Update the length of the LIS ending at i and set its count to the count of the LIS ending at j.
                        lengths[i] = lengths[j] + 1
                        counts[i] = counts[j]
                    } else if lengths[j] + 1 == lengths[i] { // If extending the LIS ending at j would create an LIS of the same length as the current LIS ending at i...
                        // Add the count of the LIS ending at j to the count of the LIS ending at i (multiple ways to achieve the same LIS length).
                        counts[i] += counts[j]
                    }
                }
            }
        }
        // Find the maximum length of an LIS.
        let maxLength = lengths.max()!
        // Initialize the total count of LIS with maximum length to 0.
        var total = 0

        // Iterate through the lengths array and sum the counts for LIS of maximum length.
        for i in 0..<n {
            if lengths[i] == maxLength {
                total += counts[i]
            }
        }

        // Return the total count of LIS with maximum length.
        return total
    }
}

/*
Explanation in Simple Terms:

The function uses dynamic programming. `lengths[i]` stores the length of the longest increasing subsequence ending at index `i`, and `counts[i]` stores how many such subsequences of that length exist. It iterates through the array, checking if each number can extend a previously found increasing subsequence. If it can, it updates the length and count accordingly. Finally, it counts the number of LIS that have the maximum length.

The key is that when it finds a longer subsequence, it copies the count from the shorter subsequence; if it finds a subsequence of the same length, it adds the counts together. This efficiently tracks the number of ways to create the longest increasing subsequences.


The time complexity is O(n^2) due to the nested loops, and the space complexity is O(n) because of the `lengths` and `counts` arrays.
*/
