//
// 1218. Longest Arithmetic Subsequence of Given Difference
// Problem: https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        // Use a dictionary to store the length of the longest subsequence ending at each number. Key is the number, value is the subsequence length.
        var dp: [Int: Int] = [:]
        // Initialize the maximum length to 0.
        var maxLength = 0

        // Iterate through each number in the array.
        for num in arr {
            // Find the previous number in the subsequence (num - difference).
            let prev = num - difference
            // If a subsequence ending at 'prev' exists, add 1 to its length to form a new subsequence ending at 'num'. Otherwise, start a new subsequence of length 1.
            dp[num] = (dp[prev] ?? 0) + 1 // nil-coalescing operator handles the case where prev is not in dp
            // Update the maximum length if a longer subsequence is found.
            maxLength = max(maxLength, dp[num]!)
        }

        // Return the maximum length found.
        return maxLength
    }

}

/*
Explanation in Simple Terms:

The function uses dynamic programming. The `dp` dictionary keeps track of the length of the longest subsequence ending at each number encountered so far. For each number `num` in the input array:

1. It checks if the previous number in the potential subsequence (`prev = num - difference`) is already in the `dp` dictionary.

2. If `prev` is found, it means we can extend an existing subsequence. The length of the new subsequence ending at `num` is one more than the length of the subsequence ending at `prev`. If `prev` is not found, it means we start a new subsequence of length 1.

3. The `maxLength` variable keeps track of the longest subsequence length encountered so far.

The function iterates through the entire array, and the final `maxLength` will be the length of the longest subsequence with the given difference between consecutive elements.


The time complexity is O(n), where n is the length of the input array, because it iterates through the array once. The space complexity is also O(n) in the worst case, as the `dp` dictionary could store up to n entries if all numbers form a single increasing subsequence.
*/
