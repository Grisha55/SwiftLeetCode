//
// 0072. Edit Distance
// Problem: https://leetcode.com/problems/edit-distance/
// SwiftLeetCode
//

import Foundation

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var a = Array(word1)
        var b = Array(word2)
        let m = a.count
        let n = b.count
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        for i in 0...m {
            dp[i][0] = i
        }

        for j in 0...n {
            dp[0][j] = j
        }
        if m > 0 && n > 0 {
            for i in 1...m {
                for j in 1...n {
                    if a[i - 1] == b[j - 1] {
                        dp[i][j] = dp[i - 1][j - 1]
                    } else {
                        dp[i][j] = 1 + min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1])
                    }
                }
            }
        }
        
        return dp[m][n]
    }
}
