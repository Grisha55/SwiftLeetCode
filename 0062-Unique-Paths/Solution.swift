//
//  0062. Unique Paths
//  Problem: https://leetcode.com/problems/unique-paths/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: 1, count: n)

        for _ in 1..<m {
            for j in 1..<n {
                dp[j] += dp[j - 1]
            }
        }

        return dp[n - 1]
    }

}
