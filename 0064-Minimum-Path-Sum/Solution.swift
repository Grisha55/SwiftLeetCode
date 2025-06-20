//
//  0064. Minimum Path Sum
//  Problem: https://leetcode.com/problems/minimum-path-sum/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count

        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        dp[0][0] = grid[0][0]

        for j in 1..<n {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }

        for i in 1..<m {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }

        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = grid[i][j] + min(dp[i - 1][j], dp[i][j - 1])
            }
        }

        return dp[m - 1][n - 1]
    }
}
