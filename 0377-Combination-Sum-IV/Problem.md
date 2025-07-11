# 0377. Combination Sum IV

## Description

Given an array of **distinct** integers `nums` and a target integer `target`, return the number of possible combinations that add up to `target`.

The test cases are generated so that the answer can fit in a **32-bit** integer.

## Example

**Input:**  
nums = [1,2,3], target = 4
<br>
**Output:**
<br>
7
<br>
**Explanation:**
<br>
The possible combination ways are:
<br>
(1, 1, 1, 1)
<br>
(1, 1, 2)
<br>
(1, 2, 1)
<br>
(1, 3)
<br>
(2, 1, 1)
<br>
(2, 2)
<br>
(3, 1)
<br>
Note that different sequences are counted as different combinations.

## Constraints

- `1 <= nums.length <= 200`
- `1 <= nums[i] <= 1000`
- All the elements `nums` are **unique**
- `1 <= target <= 1000`

**Follow up:** What if negative numbers are allowed in the given array? How does it change the problem? What limitation we need to add to the question to allow negative numbers?
