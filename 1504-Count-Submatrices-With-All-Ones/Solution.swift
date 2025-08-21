class Solution {
    func numSubmat(_ mat: [[Int]]) -> Int {
        if mat.isEmpty && mat[0].isEmpty {
            return 0
        }

        let rows = mat.count
        let cols = mat[0].count
        var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        var result = 0

        for i in 0..<rows {
            for j in 0..<cols {
                if mat[i][j] == 1 {
                    dp[i][j] = (i > 0 ? dp[i - 1][j] : 0) + 1
                    var minHeight = dp[i][j]

                    for k in stride(from: j, through: 0, by: -1) {
                        if dp[i][k] == 0 {
                            break
                        }
                        minHeight = min(minHeight, dp[i][k])
                        result += minHeight
                    }
                }
            }
        }

        return result
    }
}