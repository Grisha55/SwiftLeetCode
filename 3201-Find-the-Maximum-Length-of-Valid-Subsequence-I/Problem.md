# 3201. Find the Maximum Length of Valid Subsequence I

## Description

You are given an integer array `nums`.
A subsequence `sub` of `nums` with length `x` is called **valid** if it satisfies:

- `(sub[0] + sub[1]) % 2 == (sub[1] + sub[2]) % 2 == ... == (sub[x - 2] + sub[x - 1]) % 2.`
Return the length of the **longest valid** subsequence of `nums`.

A **subsequence** is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

## Example

**Input:**  
nums = [1,2,3,4]
<br>
**Output:**
<br>
4
<br>
**Explanation:**
<br>
The longest valid subsequence is `[1, 2, 3, 4]`.

## Constraints

- `2 <= nums.length <= 2 * 10^5`
- `1 <= nums[i] <= 10^7` 
