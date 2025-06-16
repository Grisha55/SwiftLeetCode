//
// 0120. Triangle
// Problem: https://leetcode.com/problems/triangle/
// SwiftLeetCode
//

import Foundation

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        if n == 0 { return 0 }

        // To store the minimum sums of paths to each point([i][j]).
        // Initially it contains the triangle numbers themselves.
        var dp = triangle

        for i in 1..<n {
            for j in 0..<triangle[i].count {

                // For each point `dp[i][j]`, the minimum sum of the path to it is calculated
                // If this is the leftmost point of the string:
                if j == 0 {
                    dp[i][j] += dp[i - 1][j] // the minimum path to it only comes from the top
                } else if j == triangle[i].count - 1 { // If it is the rightmost point of the string
                    dp[i][j] += dp[i - 1][j - 1] // the minimum path to it goes only from top-left to bottom-left
                } else { // For all other points, the smaller of the two possible paths is chosen:
                    dp[i][j] += min(dp[i - 1][j - 1], // top-left
                                    dp[i - 1][j])     // on top of
                }
            }
        }
        // `dp[n - 1]` is the last line (the base of the triangle).
        return dp[n - 1].min()!
    }
}
