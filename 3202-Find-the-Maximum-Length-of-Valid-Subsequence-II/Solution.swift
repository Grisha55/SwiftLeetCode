//
// 3202. Find the Maximum Length of Valid Subsequence II
// SwiftLeetCode
//

class Solution {
    func maximumLength(_ nums: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: k), count: k)
        var res = 0
        
        for num in nums {
            let mod = num % k
            for prev in 0..<k {
                dp[prev][mod] = dp[mod][prev] + 1
                res = max(res, dp[prev][mod])
            }
        }
        
        return res
    }
}

/*
Time: O(n·k²) - For each element, we iterate through k² possibilities
Space: O(k²) - For the DP table storage

Purpose
This solution finds the longest valid subsequence where all consecutive elements satisfy:
(a + b) % k == (b + c) % k == ... for every adjacent pair in the subsequence.

Key Insights
1. Modulo Tracking:
    - We track sequences based on the modulo results of element pairs
    - dp[prev][current] stores the maximum length of sequences where:
        - The previous element's modulo was prev
        - The current element's modulo is current
2. Dynamic Programming:
    - For each number, calculate its modulo num % k
    - Update the DP table by considering all possible previous mod values (0..<k)
    - The new sequence length is dp[current][prev] + 1
3. Result Calculation:
    - Keep track of the maximum sequence length found (res)
    - Return this maximum value

Why It Works
- Efficiently tracks valid sequences using modulo arithmetic
- Builds solution incrementally using dynamic programming
- Handles all possible valid configurations in O(n·k²) time
*/
