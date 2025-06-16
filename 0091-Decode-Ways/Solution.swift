//
// 0091. Decode Ways
// Problem: https://leetcode.com/problems/decode-ways/
// SwiftLeetCode
//

import Foundation

class Solution {
    func numDecodings(_ s: String) -> Int {
        var sArr = Array(s)
        var n = sArr.count
        
        // Edge case: If string starts with '0', it can't be decoded
        if n == 0 || sArr[0] == "0" {
            return 0
        }

        // For a single character that is not '0', there's only 1 decoding
        if n == 1 {
            return 1
        }

        // dp[i] - how many ways to decode the first i characters of the string.
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1 // Empty string has one way to decode (do nothing)
        dp[1] = 1 // One valid character has one way to decode

        for i in 2...n {

            let oneDigit = Int(String(sArr[i - 1]))!                        // Single digit
            let twoDigits = Int(String(sArr[i - 2]) + String(sArr[i - 1]))! // Two digits

            if 1 <= oneDigit && oneDigit <= 9 {
                dp[i] += dp[i - 1] // Valid single-digit letter
            }

            if 10 <= twoDigits && twoDigits <= 26 {
                dp[i] += dp[i - 2] // Valid two-digit letter
            }
        }

        return dp[n]
    }
}
