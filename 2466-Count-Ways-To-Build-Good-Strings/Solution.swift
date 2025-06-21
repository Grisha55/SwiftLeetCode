//
// 2466. Count Ways To Build Good Strings
// Problem: https://leetcode.com/problems/count-ways-to-build-good-strings/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
        let m = 1_000_000_007 // Modulo value to prevent integer overflow.
        var dp = Array(repeating: 0, count: high + 1) // Initialize a DP array. dp[i] stores the number of good strings of length i.
        dp[0] = 1 // Base case: There's one string of length 0 (the empty string).

        // Iterate through all possible string lengths from 1 to high.
        for i in 1...high {
            // If the current length (i) is greater than or equal to the length of a 'zero' string...
            if i >= zero {
                // ...then we can add the number of good strings of length (i - zero) to the number of good strings of length i.
                dp[i] = (dp[i] + dp[i - zero]) % m // We use modulo to prevent integer overflow.
            }

            // Similarly, if the current length (i) is greater than or equal to the length of a 'one' string...
            if i >= one {
                // ...then we can add the number of good strings of length (i - one) to the number of good strings of length i.
                dp[i] = (dp[i] + dp[i - one]) % m // We use modulo to prevent integer overflow.
            }
        }

        // Sum up the number of good strings for lengths from low to high.
        var result = 0
        for i in low...high {
            result = (result + dp[i]) % m // We use modulo to prevent integer overflow.
        }

        return result // Return the total number of good strings.
    }
}

/*
Explanation in Simple Terms:

The function uses dynamic programming to build up the solution. `dp[i]` represents the number of "good" strings of length `i`. A "good" string is one that can be constructed by concatenating strings of length `zero` or `one`.

The algorithm iterates through possible string lengths. For each length `i`, it considers two possibilities:

1. Adding a "zero" string: If `i` is greater than or equal to `zero`, it adds the number of good strings of length `i - zero` to `dp[i]`.
2. Adding a "one" string: If `i` is greater than or equal to `one`, it adds the number of good strings of length `i - one` to `dp[i]`.

Finally, it sums the counts for lengths between `low` and `high` (inclusive) to get the final result. The modulo operation (`% m`) prevents integer overflow.


The time complexity is O(high), and the space complexity is O(high) due to the DP array. This is efficient because it avoids redundant calculations by storing and reusing previously computed results.
*/
