# 2040. Kth Smallest Product of Two Sorted Arrays

## Description

Given two **sorted 0-indexed** integer arrays `nums1` and `nums2` as well as an integer `k`, return the `kth` (**1-based**) smallest product of `nums1[i] * nums2[j]` where `0 <= i < nums1.length and 0 <= j < nums2.length`.

## Example

**Input:**  
nums1 = [2,5], nums2 = [3,4], k = 2
<br>
**Output:**
<br>
8
<br>
**Explanation:**
<br>
 The 2 smallest products are:  
- nums1[0] * nums2[0] = 2 * 3 = 6
- nums1[0] * nums2[1] = 2 * 4 = 8
The 2nd smallest product is 8.

## Constraints

- `1 <= nums1.length, nums2.length <= 5 * 10^4`
- -`10^5 <= nums1[i], nums2[j] <= 10^5`
- `1 <= k <= nums1.length * nums2.length`
- `nums1` and `nums2` are sorted.
