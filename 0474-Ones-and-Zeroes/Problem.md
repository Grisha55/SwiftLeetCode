# 0474. Ones and Zeroes

## Description

You are given an array of binary strings `strs` and two integers `m` and `n`.

Return the size of the largest subset of `strs` such that there are **at most** `m` `0`'s and `n` `1`'s in the subset.

A set `x` is a **subset** of a set `y` if all elements of `x` are also elements of `y`.

## Example

**Input:**  
strs = ["10","0001","111001","1","0"], m = 5, n = 3
<br>
**Output:**
<br>
4
<br>
**Explanation:**
<br>
The largest subset with at most 5 0's and 3 1's is {"10", "0001", "1", "0"}, so the answer is 4.
Other valid but smaller subsets include {"0001", "1"} and {"10", "1", "0"}.
{"111001"} is an invalid subset because it contains 4 1's, greater than the maximum of 3.

## Constraints

- `1 <= strs.length <= 600`
- `1 <= strs[i].length <= 100`
- `strs[i]` consists only of digits `'0'` and `'1'`.
- `1 <= m, n <= 100`
