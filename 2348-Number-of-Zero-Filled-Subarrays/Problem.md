# 2348. Number of Zero-Filled Subarrays

## Description

Given an integer array nums, return the number of subarrays filled with 0.

A subarray is a contiguous non-empty sequence of elements within an array.

## Example

**Input:**
nums = [1,3,0,0,2,0,0,4]
<br>
**Output:**
<br>
6
<br>
**Explanation:**
<br>
There are 4 occurrences of [0] as a subarray.
There are 2 occurrences of [0,0] as a subarray.
There is no occurrence of a subarray with a size more than 2 filled with 0. Therefore, we return 6.

## Constraints

- `1 <= nums.length <= 10^5`
- `-10^9 <= nums[i] <= 10^9`
