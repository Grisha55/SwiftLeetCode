# 2294. Partition Array Such That Maximum Difference Is K

## Description

You are given an integer array `nums` and an integer `k`. You may partition `nums` into one or more **subsequences** such that each element in nums appears in **exactly** one of the subsequences.

Return the **minimum** number of subsequences needed such that the difference between the maximum and minimum values in each subsequence is **at most** `k`.

A **subsequence** is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

## Example

**Input:**  
<br>
nums = [3,6,1,2,5], k = 2
<br>
**Output:**
<br>
2
<br>
**Explanation:**
<br>
We can partition nums into the two subsequences [3,1,2] and [6,5].
The difference between the maximum and minimum value in the first subsequence is 3 - 1 = 2.
<br>
The difference between the maximum and minimum value in the second subsequence is 6 - 5 = 1.
<br>
Since two subsequences were created, we return 2. It can be shown that 2 is the minimum number of subsequences needed.

## Constraints

- `1 <= nums.length <= 10^5`
- `0 <= nums[i] <= 10^5`
- `0 <= k <= 10^5`
