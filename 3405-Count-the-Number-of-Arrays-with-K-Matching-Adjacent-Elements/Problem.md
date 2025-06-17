# 3405. Count the Number of Arrays with K Matching Adjacent Elements

## Description

You are given three integers `n`, `m`, `k`. A **good array** `arr` of size `n` is defined as follows:

- Each element in `arr` is in the **inclusive** range `[1, m]`.
- Exactly `k` indices `i` (where `1 <= i < n`) satisfy the condition `arr[i - 1] == arr[i]`.
Return the number of **good arrays** that can be formed.

Since the answer may be very large, return it **modulo** `10^9 + 7`.

## Example

**Input:**
<br>
n = 3, m = 2, k = 1
<br>
**Output:**
<br>
4
<br>
**Explanation:**
- There are 4 good arrays. They are [1, 1, 2], [1, 2, 2], [2, 1, 1] and [2, 2, 1].
- Hence, the answer is 4.

## Constraints

- `1 <= n <= 10^5`
- `1 <= m <= 10^5`
- `0 <= k <= n - 1`
