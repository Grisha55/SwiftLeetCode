//
// 1027. Longest Arithmetic Subsequence
// Problem: https://leetcode.com/problems/longest-arithmetic-subsequence/
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestArithSeqLength(_ nums: [Int]) -> Int {
        let n = nums.count
        if n <= 1 { return n } // If 0 or 1 element, return n (no arithmetic sequence possible)

        // dp[i] will store a dictionary: [difference: length of sequence ending at i]
        var dp = Array(repeating: [Int: Int](), count: n)
        var maxLength = 2 // At least 2 elements are needed for a sequence

        // Loop through all pairs (j, i) where j < i
        for i in 1..<n {
            for j in 0..<i {
                let diff = nums[i] - nums[j] // Calculate difference between elements

                // If there’s already a sequence ending at j with same diff, extend it
                // Otherwise, start a new sequence of length 2 (nums[j], nums[i])
                let len = dp[j][diff] ?? 1

                // Update the sequence length ending at i with this diff
                dp[i][diff] = len + 1

                // Keep track of the maximum sequence length found
                maxLength = max(maxLength, dp[i][diff]!)
            }
        }

        return maxLength // Return the longest arithmetic sequence length
    }
}

/*
💡 Solution idea:
1. We will use dynamic programming (DP).
2. For each pair of elements nums[j] and nums[i] (where j < i), we will calculate the difference diff = nums[i] - nums[j].
3. We store a dictionary in dp[i]: the key is diff, the value is the length of the longest sequence ending in nums[i] with the difference diff.


🔍 Example:
Input: [3, 6, 9, 12]
The difference +3 is repeated, and we can build [3, 6, 9, 12] — length 4.
Answer: 4

📊 Complexity:
Time: O(n^2) — double loop over elements.
Memory: O(n * d) — where d is the number of possible differences (diff), usually no more than the range of nums values.
*/
