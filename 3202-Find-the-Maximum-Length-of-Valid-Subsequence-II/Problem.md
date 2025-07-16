# 3202. Find the Maximum Length of Valid Subsequence II

## Description

You are given an integer array `nums` and a **positive** integer `k`.
A subsequence `sub` of `nums` with length `x` is called valid if it satisfies:

`(sub[0] + sub[1]) % k == (sub[1] + sub[2]) % k == ... == (sub[x - 2] + sub[x - 1]) % k.`
Return the length of the **longest valid** subsequence of `nums`.

## Example

**Input:**  
nums = [1,2,3,4,5], k = 2
<br>
**Output:**
<br>
5
<br>
**Explanation:**
<br>
The longest valid subsequence is [1, 2, 3, 4, 5].

## Constraints

- `2 <= nums.length <= 10^3`
- `1 <= nums[i] <= 10^7`
- `1 <= k <= 10^3` 
