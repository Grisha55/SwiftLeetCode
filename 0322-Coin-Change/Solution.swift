//
// 0322. Coin Change
// Problem: https://leetcode.com/problems/coin-change/
// SwiftLeetCode
//

import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var n = coins.count

        // If there are no coins, we can't make any amount.
        if n == 0 { return 0 }

        // dp[i] stores the minimum number of coins needed to make amount i.
        // Initialize dp array with a value greater than the amount. This ensures that any value calculated will be smaller.
        var dp = Array(repeating: amount + 1, count: amount + 1)

        // Base case: 0 coins needed to make amount 0.
        dp[0] = 0

        // Iterate through all possible amounts from 1 to amount.
        for i in 0...amount {

            // Iterate through each coin denomination.
            for coin in coins {

                // If the coin value is less than or equal to the current amount i
                if i - coin >= 0 {

                    // Update dp[i] to the minimum of its current value and the number of coins needed to make i - coin (from dp[i - coin]) + 1 (for the current coin).
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }

        // If dp[amount] is still greater than amount, it means we couldn't make the amount with the given coins.
        return dp[amount] > amount ? -1 : dp[amount]
    }
}

/*
Explanation in simple terms:

The function uses dynamic programming to build a table (`dp`) where `dp[i]` represents the minimum number of coins needed to make the amount `i`.

It starts by initializing the table with a large value (`amount + 1`) for all amounts except for `dp[0]`, which is 0 (because it takes 0 coins to make amount 0).

Then, it iterates through each possible amount from 1 to the target amount. For each amount, it considers each coin denomination. If a coin's value is less than or equal to the current amount, it updates the minimum number of coins needed for that amount. The update uses `min` to ensure we always keep the smallest number of coins found so far.

Finally, it checks if `dp[amount]` is still the initial large value. If it is, it means the target amount could not be reached using the given coins, and -1 is returned. Otherwise, it returns the minimum number of coins found.


Example:

Let's say `coins = [1, 2, 5]` and `amount = 11`.

The `dp` array would be updated as follows (simplified):

- `dp[0] = 0`
- `dp[1] = 1` (1 coin of value 1)
- `dp[2] = 1` (1 coin of value 2)
- `dp[3] = 2` (2 coins of value 1)
- `dp[4] = 2` (2 coins of value 2)
- `dp[5] = 1` (1 coin of value 5)
- `dp[6] = 2` (1 coin of value 5 + 1 coin of value 1)
- `dp[7] = 2` (1 coin of value 5 + 2 coins of value 1)
- `dp[8] = 3` (3 coins of value 2) or (1 coin of value 5 + 3 coins of value 1)
- `dp[9] = 3` (1 coin of value 5 + 4 coins of value 1)
- `dp[10] = 2` (2 coins of value 5)
- `dp[11] = 3` (2 coins of value 5 + 1 coin of value 1)

The function would then return `dp[11]`, which is 3.
*/
