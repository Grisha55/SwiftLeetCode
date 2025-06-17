# 0167. Two Sum II - Input Array Is Sorted

## Description

Given a 1-indexed array of integers `numbers` that is already sorted in non-decreasing order, find two numbers such that they add up to a specific `target` number. Let these two numbers be `numbers[index1]` and `numbers[index2]` where `1 <= index1 < index2 <= numbers.length`.

Return the indices of the two numbers, `index1` and `index2`, **added by one** as an integer array `[index1, index2]` of length 2.

The tests are generated such that there is **exactly one solution**. You **may not** use the same element twice.

Your solution must use only constant extra space.

## Example

**Input:**  
<br>
numbers = [2,7,11,15], target = 9
<br>
**Output:**
<br>
[1,2]
<br>
**Explanation:**
<br>
The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].

## Constraints

- `2 <= numbers.length <= 3 * 10^4`
- `-1000 <= numbers[i] <= 1000`
- `numbers` is sorted in **non-decreasing order**.
- `-1000 <= target <= 1000`
- The tests are generated such that there is **exactly one solution**.

