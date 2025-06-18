# 2966. Divide Array Into Arrays With Max Difference

## Description

You are given an integer array `nums` of size `n` where `n` is a multiple of 3 and a positive integer `k`.

Divide the array `nums` into `n / 3` arrays of size 3 satisfying the following condition:

- The difference between **any** two elements in one array is **less than or equal** to `k`.
Return a **2D** array containing the arrays. If it is impossible to satisfy the conditions, return an empty array. And if there are multiple answers, return **any** of them.

## Example

**Input:**  
<br>
nums = [1,3,4,8,7,9,3,5,1], k = 2
<br>
**Output:**
<br>
[[1,1,3],[3,4,5],[7,8,9]]
<br>
**Explanation:**
<br>
The difference between any two elements in each array is less than or equal to 2.

## Constraints

- `n == nums.length`
- `1 <= n <= 10^5`
- `n` is a multiple of 3
- `1 <= nums[i] <= 10^5`
- `1 <= k <= 10^5`

