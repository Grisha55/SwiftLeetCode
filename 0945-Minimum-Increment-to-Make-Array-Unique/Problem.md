# 0945. Minimum Increment to Make Array Unique

## Description

You are given an integer array `nums`. In one move, you can pick an index `i` where `0 <= i < nums.length` and increment `nums[i]` by `1`.

Return the minimum number of moves to make every value in `nums` unique.

The test cases are generated so that the answer fits in a 32-bit integer.

## Example

**Input:**  
nums = [1,2,2]
<br>
**Output:**
<br>
1
<br>
**Explanation:**
<br>
After 1 move, the array could be [1, 2, 3].

## Constraints

- `1 <= nums.length <= 10^5`
- `0 <= nums[i] <= 10^5` 