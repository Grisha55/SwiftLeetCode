//
// 1137. N-th Tribonacci Number
// Problem: https://leetcode.com/problems/n-th-tribonacci-number/
// SwiftLeetCode
//

import Foundation

class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 || n == 2 { return 1 }
        var fib = [0, 1, 1]
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 1

        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
        }

        return dp[n]
    }
}
