# 2616. Minimize the Maximum Difference of Pairs

## Description

You are given a **0-indexed** integer array `nums` and an integer `p`. Find `p` pairs of indices of `nums` such that the **maximum** difference amongst all the pairs is **minimized**. Also, ensure no index appears more than once amongst the `p` pairs.

Note that for a pair of elements at the index `i` and `j`, the difference of this pair is `|nums[i] - nums[j]|`, where `|x|` represents the **absolute value** of `x`.

Return the **minimum maximum** difference among all `p` pairs. We define the maximum of an empty set to be zero.

## Example

**Input:**  
nums = [10,1,2,7,1,3], p = 2
<br>
**Output:**
<br>
1
<br>
**Explanation:**
<br>
The first pair is formed from the indices 1 and 4, and the second pair is formed from the indices 2 and 5. 
<br>
The maximum difference is max(|nums[1] - nums[4]|, |nums[2] - nums[5]|) = max(0, 1) = 1. Therefore, we return 1.

## Constraints

- `1 <= nums.length <= 10^5`
- `0 <= nums[i] <= 10^9`
- `0 <= p <= (nums.length)/2`
