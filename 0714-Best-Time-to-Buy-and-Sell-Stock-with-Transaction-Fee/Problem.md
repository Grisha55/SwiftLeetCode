# 0714. Best Time to Buy and Sell Stock with Transaction Fee

## Description

You are given an array `prices` where `prices[i]` is the price of a given stock on the `ith` day, and an integer `fee` representing a transaction fee.

Find the maximum profit you can achieve. You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction.

**Note:**

- You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).
- The transaction fee is only charged once for each stock purchase and sale.


## Example

**Input:**  
prices = [1,3,2,8,4,9], fee = 2
<br>
**Output:**
<br>
8
<br>
**Explanation:**
<br>
The maximum profit can be achieved by:
<br>
- Buying at prices[0] = 1
<br>
- Selling at prices[3] = 8
<br>
- Buying at prices[4] = 4
<br>
- Selling at prices[5] = 9
<br>
The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.

## Constraints

- `1 <= prices.length <= 5 * 10^4`
- `1 <= prices[i] < 5 * 10^4`
- `0 <= fee < 5 * 10^4`
