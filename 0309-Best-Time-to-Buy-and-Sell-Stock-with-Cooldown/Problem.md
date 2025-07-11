# 0309. Best Time to Buy and Sell Stock with Cooldown

## Description

You are given an array `prices` where `prices[i]` is the price of a given stock on the `ith` day.

Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times) with the following restrictions:

- After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).
**Note:** You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

## Example

**Input:**  
prices = [1,2,3,0,2]
<br>
**Output:**
<br>
3
<br>
**Explanation:**
<br>
transactions = [buy, sell, cooldown, buy, sell]

## Constraints

- `1 <= prices.length <= 5000`
- `0 <= prices[i] <= 1000`
