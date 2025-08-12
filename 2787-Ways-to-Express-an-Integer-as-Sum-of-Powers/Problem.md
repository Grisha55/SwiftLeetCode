# 2787. Ways to Express an Integer as Sum of Powers

## Description

Given two positive integers `n` and `x`.

Return the number of ways `n` can be expressed as the sum of the `xth` power of unique positive integers, in other words, the number of sets of unique integers `[n1, n2, ..., nk]` where `n = n1x + n2x + ... + nkx.`

Since the result can be very large, return it modulo `10^9 + 7`.

For example, if `n = 160` and `x = 3`, one way to express `n` is `n = 23 + 33 + 53`.

## Example

**Input:**  
n = 10, x = 2
<br>
**Output:**
<br>
1
<br>
**Explanation:**
<br>
We can express n as the following: n = 32 + 12 = 10.  
It can be shown that it is the only way to express 10 as the sum of the 2nd power of unique integers.

## Constraints

- `1 <= n <= 300`
- `1 <= x <= 5`