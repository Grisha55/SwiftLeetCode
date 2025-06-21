# 1027. Longest Arithmetic Subsequence

## Description

Given an array `nums` of integers, return the length of the longest arithmetic subsequence in `nums`.

**Note** that:

- **A subsequence** is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.
- A sequence `seq` is arithmetic if `seq[i + 1] - seq[i]` are all the same value (for `0 <= i < seq.length - 1)`.

## Example

**Input:**  
nums = [3,6,9,12]
<br>
**Output:**
<br>
4
<br>
**Explanation:**
<br>
The whole array is an arithmetic sequence with steps of length = 3.

## Constraints

- `2 <= nums.length <= 1000`
- `0 <= nums[i] <= 500`
