//
// 1035. Uncrossed Lines
// Problem: https://leetcode.com/problems/uncrossed-lines/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let m = nums2.count

        // Create a 2D DP table initialized with zeros, size (n+1) x (m+1)
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

        // Loop through all positions of nums1 and nums2
        for i in 1...n {
            for j in 1...m {
                // If current elements are equal, we can draw a new line
                if nums1[i - 1] == nums2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1 // Take previous value and add 1
                } else {
                    // Otherwise, skip one element from either nums1 or nums2
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]) // Take the max of two options
                }
            }
        }

        // Return the final result — the max number of lines we can draw
        return dp[n][m]
    }

}

/*
💡 The idea in simple words:
    - If the elements at the current positions are equal, you can connect them (add a line).
    - If they are not equal, take the maximum of two options: skip one element either from the first array or from the second.
    - We use dynamic programming to accumulate the best result at each step.

🔍 Example:
nums1 = [1, 4, 2]
nums2 = [1, 2, 4]
Here:
You can connect 1 to 1, 2 to 2 → 2 lines.
Or 1 to 1, 4 to 4 → also 2 lines.
Answer: 2

📊 Complexity:
Time: O(n * m) — double loop over two arrays.
Memory: O(n * m) — DP table.
*/
