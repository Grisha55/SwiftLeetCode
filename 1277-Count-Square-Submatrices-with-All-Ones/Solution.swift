class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        if matrix.isEmpty && matrix[0].isEmpty {
            return 0
        }

        let rows = matrix.count
        let cols = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        var count = 0

        for i in 0..<rows {
            for j in 0..<cols {
                if matrix[i][j] == 1 {
                    if i == 0 || j == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                    }

                    count += dp[i][j]
                }
            }
        }

        return count
    }
}