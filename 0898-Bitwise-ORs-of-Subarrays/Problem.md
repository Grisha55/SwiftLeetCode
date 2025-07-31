# 0898. Bitwise ORs of Subarrays

## Description

Given an integer array `arr`, return the number of distinct bitwise ORs of all the non-empty subarrays of `arr`.

The bitwise OR of a subarray is the bitwise OR of each integer in the subarray. The bitwise OR of a subarray of one integer is that integer.

A subarray is a contiguous non-empty sequence of elements within an array.

## Example

**Input:**  
arr = [1,1,2]
<br>
**Output:**
<br>
3
<br>
**Explanation:**
<br>
The possible subarrays are [1], [1], [2], [1, 1], [1, 2], [1, 1, 2].  
These yield the results 1, 1, 2, 1, 3, 3.  
There are 3 unique values, so the answer is 3.  

## Constraints

- `1 <= arr.length <= 5 * 10^4`
- `0 <= arr[i] <= 10^9` 
