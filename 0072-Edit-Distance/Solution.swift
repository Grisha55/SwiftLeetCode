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
        
        // dp[i][j] - is the minimum number of operations to turn the first i characters of word1 into the first j characters of word2.
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

        // If word2 is empty (j == 0), then we need i delete operations from word1 to get an empty string.
        for i in 0...m {
            dp[i][0] = i
        }

        // If word1 is empty (i == 0), it takes j insertions to get word2.
        for j in 0...n {
            dp[0][j] = j
        }
        if m > 0 && n > 0 {
            for i in 1...m {
                for j in 1...n {
                    // If the characters are the same, no operation is needed, so we take the value on the diagonal dp[i-1][j-1].
                    if a[i - 1] == b[j - 1] {
                        dp[i][j] = dp[i - 1][j - 1]
                    } else {
                        // If different, we take the minimum of these three:
                        dp[i][j] = 1 + min(dp[i - 1][j],      // delete
                                           dp[i][j - 1],      // insert
                                           dp[i - 1][j - 1])  // replace
                    }
                }
            }
        }
        
        return dp[m][n]
    }
}
