# 0518. Coin Change II

## Description

You are given an integer array `coins` representing coins of different denominations and an integer `amount` representing a total amount of money.

Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return `0`.

You may assume that you have an infinite number of each kind of coin.

The answer is **guaranteed** to fit into a signed **32-bit** integer.

## Example

**Input:**  
amount = 5, coins = [1,2,5]
<br>
**Output:**
<br>
4
<br>
**Explanation:**
<br>
there are four ways to make up the amount:
<br>
5=5
<br>
5=2+2+1
<br>
5=2+1+1+1
<br>
5=1+1+1+1+1

## Constraints

- `1 <= coins.length <= 300`
- `1 <= coins[i] <= 5000`
- All the values of `coins` are **unique**.
- `0 <= amount <= 5000`
