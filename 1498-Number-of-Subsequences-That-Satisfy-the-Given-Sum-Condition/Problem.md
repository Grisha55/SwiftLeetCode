# Problem: 1498. Number of Subsequences That Satisfy the Given Sum Condition

## Description

You are given an array of integers `nums` and an integer `target`.

Return the number of **non-empty subsequences** of `nums` such that the sum of the **minimum** and **maximum** elements in the subsequence is **less than or equal to** `target`.

Since the answer may be very large, return it **modulo** `10⁹ + 7`.

---

## Example

**Input:**  
nums = [3,5,6,7], target = 9
<br>
**Output:**
<br>
4
<br>
**Explanation:**
<br>
There are 4 subsequences that satisfy the condition.  
[3] -> Min value + max value <= target (3 + 3 <= 9)  
[3,5] -> (3 + 5 <= 9)  
[3,5,6] -> (3 + 6 <= 9)  
[3,6] -> (3 + 6 <= 9)  

## Constraints

- `1 <= nums.length <= 10^5`
- `1 <= nums[i] <= 10^6`
- `1 <= target <= 10^6`

