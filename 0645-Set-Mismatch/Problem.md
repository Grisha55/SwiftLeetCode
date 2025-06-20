# 0645. Set Mismatch

## Description

You have a set of integers `s`, which originally contains all the numbers from `1` to `n`. Unfortunately, due to some error, one of the numbers in `s` got duplicated to another number in the set, which results in **repetition of one** number and **loss of another** number.

You are given an integer array `nums` representing the data status of this set after the error.

Find the number that occurs twice and the number that is missing and return them in the form of an array.

## Example

**Input:**  
nums = [1,2,2,4]
<br>
**Output:**
<br>
[2,3]

## Constraints

- `2 <= nums.length <= 10^4`
- `1 <= nums[i] <= 10^4`
