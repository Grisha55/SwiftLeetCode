# 2566. Maximum Difference by Remapping a Digit

**Difficulty**: Easy  
**Link**: [LeetCode](https://leetcode.com/problems/maximum-difference-by-remapping-a-digit/)

---

## Description

You are given an integer `num`. You know that Bob will sneakily remap **one of the 10 possible digits (0 to 9)** to **another digit**.

Return the **difference between the maximum and minimum values** Bob can make by remapping **exactly one digit** in `num`.

### Notes:

- Bob replaces **all occurrences** of a digit `d1` with another digit `d2`.
- Bob can remap a digit to itself (i.e., no change).
- Bob can use **different remappings** to get the maximum and minimum values.
- The resulting number **can have leading zeros**.

---

## Example

**Input**:  
`num = 11891`  
**Output**:  
`88808`

**Explanation**:  
Maximum = replace 1 → 9 → 99899  
Minimum = replace 8 → 0 → 11091  
Difference = 99899 - 11091 = 88808

---

## Constraints

- `1 <= num <= 10^8`

