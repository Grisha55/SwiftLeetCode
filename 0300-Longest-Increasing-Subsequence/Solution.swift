//
// 0300. Longest Increasing Subsequence
// Problem: https://leetcode.com/problems/longest-increasing-subsequence/
// SwiftLeetCode
//

import Foundation

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var n = nums.count

        // Initialize a DP array. dp[i] will store the length of the LIS ending at index i. We initialize all values to 1 because a single element is always an increasing subsequence of length 1.
        var dp = Array(repeating: 1, count: n)

        // Iterate through the input array.
        for i in 0..<n {

            // Iterate through the elements before the current element.
            for j in 0..<i {

                // If the current element is greater than the previous element, it can extend the increasing subsequence.
                if nums[j] < nums[i] {

                    // // Update dp[i] to be the maximum of its current value and the length of the LIS ending at index j plus 1 (to include the current element).
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }

        // Find the maximum value in the dp array. This maximum value represents the length of the longest increasing subsequence in the entire array.
        return dp.max()!
    }
}

/*
Imagine you have a sequence of numbers. The goal is to find the longest sequence within that original sequence where the numbers are strictly increasing.

This function uses a technique called dynamic programming. It creates a helper array (`dp`) where each element `dp[i]` represents the length of the longest increasing subsequence ending at index `i` of the input array (`nums`).

The outer loop iterates through each number in the input array. The inner loop checks all the numbers *before* the current number. If a previous number is smaller than the current number, it means we can extend an increasing subsequence. We update `dp[i]` to reflect the new, longer subsequence.

Finally, the function returns the maximum value in the `dp` array, which represents the length of the longest increasing subsequence found in the entire input array.

*/
