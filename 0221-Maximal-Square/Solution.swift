//
// 0221. Maximal Square
// Problem: https://leetcode.com/problems/maximal-square/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var n = matrix.count // number of rows in the matrix
        if n == 0 { return 0 } // if matrix is empty -> return 0
        var m = matrix[0].count // number of columns in the matrix

        // Create a DP table with (n+1) rows and (m+1) columns, filled with 0s
        // We use n+1 and m+1 to simplify edge cases (avoiding index out of bounds)
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

        var maxSize = 0 // // This will store the size of the largest square found

        // Loop through the matrix starting from 1 to n (for rows)
        for i in 1...n {

            // Loop through the matrix starting from 1 to m (for columns)
            for j in 1...m {

                // If the current cell in the original matrix is '1'
                if matrix[i - 1][j - 1] == "1" {

                    // Set dp[i][j] to the minimum of three neighboring squares + 1
                    // These neighbors are: top, left, and top-left (diagonal)
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1

                    // Update the maxSize if we've found a larger square
                    maxSize = max(maxSize, dp[i][j])
                }
            }
        }

        // Return the area of the largest square found (side * side)
        return maxSize * maxSize
    }
}
