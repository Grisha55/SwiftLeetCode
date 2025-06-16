//
// 0115. Distinct Subsequences
// Problem: https://leetcode.com/problems/distinct-subsequences/
// SwiftLeetCode
//

import Foundation

class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let s = Array(s), t = Array(t)

        // dp[i][j] - This is a table where we store the number of ways to get t[0...j] from s[0...i],
        // so that we don't have to count the same substring over and over again.
        var dp = Array(repeating: Array(repeating: -1, count: t.count), count: s.count)
        
        func numDistinct(_ i: Int, _ j: Int) -> Int {
            if j < 0 { return 1 } // If the substring t has already ended (everything matched), there is one way - successfully found the substring.
            if i < 0 { return 0 } // If the string s has ended and t has not yet ended, there are no methods.
            
            if dp[i][j] != -1 { return dp[i][j] }
            
            if s[i] != t[j] {
                dp[i][j] = numDistinct(i - 1, j) // We skip character s[i] and try to find t[0...j] in the rest of the string s.
            } else {
                // First option: don't use s[i], move on s, leaving t as it is.
                // Second option: use s[i] as part of t[j], then shorten both strings.
                dp[i][j] = numDistinct(i - 1, j) + numDistinct(i - 1, j - 1)
            }
            
            return dp[i][j]
        }
        
        return numDistinct(s.count - 1, t.count - 1)
    }

}
