//
//  0062. Unique Paths II
//  Problem: https://leetcode.com/problems/unique-paths-ii/
//  SwiftLeetCode
//

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let n = obstacleGrid.count
        let m = obstacleGrid[0].count

        // dp[i][j] - number of possible paths to get to the cell i;j
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        dp[0][0] = obstacleGrid[0][0] == 0 ? 1 : 0

        for i in 0..<n {
            for j in 0..<m {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                } else {
                    if i > 0 {
                        dp[i][j] += dp[i - 1][j]
                    }
                    if j > 0 {
                        dp[i][j] += dp[i][j - 1]
                    }
                }
            }
        }
        return dp[n - 1][m - 1]
    }
}
