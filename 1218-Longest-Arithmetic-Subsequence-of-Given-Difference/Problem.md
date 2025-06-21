# 1218. Longest Arithmetic Subsequence of Given Difference

## Description

Given an integer array `arr` and an integer `difference`, return the length of the longest subsequence in `arr` which is an arithmetic sequence such that the difference between adjacent elements in the subsequence equals `difference`.

A **subsequence** is a sequence that can be derived from arr by deleting some or no elements without changing the order of the remaining elements.

## Example

**Input:**  
arr = [1,2,3,4], difference = 1
<br>
**Output:**
<br>
4
<br>
**Explanation:**
<br>
The longest arithmetic subsequence is [1,2,3,4].

## Constraints

- `1 <= arr.length <= 10^5`
- `-10^4 <= arr[i], difference <= 10^4`
