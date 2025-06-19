# 0322. Coin Change

## Description

You are given an integer array `coins` representing coins of different denominations and an integer `amount` representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return `-1`.

You may assume that you have an infinite number of each kind of coin.



## Example

**Input:**  
coins = [1,2,5], amount = 11
<br>
**Output:**
<br>
3
<br>
**Explanation:**
<br>
11 = 5 + 5 + 1

## Constraints

- `1 <= coins.length <= 12`
- `1 <= coins[i] <= 2^31 - 1`
- `0 <= amount <= 10^4`
