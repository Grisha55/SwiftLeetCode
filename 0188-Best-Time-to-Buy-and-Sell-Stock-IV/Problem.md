# 0188. Best Time to Buy and Sell Stock IV

## Description

You are given an integer array `prices` where `prices[i]` is the price of a given stock on the `ith` day, and an integer `k`.

Find the maximum profit you can achieve. You may complete at most `k` transactions: i.e. you may buy at most `k` times and sell at most `k` times.

**Note:** You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

## Example

**Input:**  
<br>
k = 2, prices = [2,4,1]
<br>
**Output:**
<br>
2
<br>
**Explanation:**
<br>
Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.

## Constraints

- `1 <= k <= 100`
- `1 <= prices.length <= 1000`
- `0 <= prices[i] <= 1000`
