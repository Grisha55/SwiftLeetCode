# 0870. Advantage Shuffle

## Description

You are given two integer arrays nums1 and nums2 both of the same length. The advantage of nums1 with respect to nums2 is the number of indices i for which nums1[i] > nums2[i].

Return any permutation of nums1 that maximizes its advantage with respect to nums2.

## Example

**Input:**
nums1 = [2,7,11,15], nums2 = [1,10,4,11]
<br>
**Output:**
<br>
[2,11,7,15]
<br>

## Constraints

- `1 <= nums1.length <= 10^5`
- `nums2.length == nums1.length`
- `0 <= nums1[i], nums2[i] <= 10^9`
