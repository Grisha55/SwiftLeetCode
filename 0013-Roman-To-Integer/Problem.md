# 0013. Roman to Integer

**Difficulty**: Easy  
**Link**: [LeetCode](https://leetcode.com/problems/roman-to-integer/)

---

## Description

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

- I can be placed before V (5) and X (10) to make 4 and 9. 
- X can be placed before L (50) and C (100) to make 40 and 90. 
- C can be placed before D (500) and M (1000) to make 400 and 900.

Given a roman numeral, convert it to an integer.

---

## Example

**Input**:  
`s = "III"`  
**Output**:  
`3`

**Explanation**:  
III = 3

---

## Constraints

- `1 <= s.length <= 15`
- `s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').`
- `It is guaranteed that s is a valid roman numeral in the range [1, 3999].`

