# 0740. Delete and Earn

## Description

You are given an integer array `nums`. You want to maximize the number of points you get by performing the following operation any number of times:

- Pick any `nums[i]` and delete it to earn `nums[i]` points. Afterwards, you must delete every element equal to `nums[i] - 1` and **every** element equal to `nums[i] + 1`.
Return the **maximum number of points** you can earn by applying the above operation some number of times.

## Example

**Input:**  
nums = [3,4,2]
<br>
**Output:**
<br>
6
<br>
**Explanation:**
<br>
You can perform the following operations:
<br>
- Delete 4 to earn 4 points. Consequently, 3 is also deleted. nums = [2].
- Delete 2 to earn 2 points. nums = [].
You earn a total of 6 points.

## Constraints

- `1 <= nums.length <= 2 * 10^4`
- `1 <= nums[i] <= 10^4`
