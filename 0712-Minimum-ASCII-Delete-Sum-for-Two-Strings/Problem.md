# 0712. Minimum ASCII Delete Sum for Two Strings

## Description

Given two strings `s1` and `s2`, return the lowest **ASCII** sum of deleted characters to make two strings equal.

## Example

**Input:**  
s1 = "sea", s2 = "eat"
<br>
**Output:**
<br>
231
<br>
**Explanation:**
<br>
Deleting "s" from "sea" adds the ASCII value of "s" (115) to the sum.
<br>
Deleting "t" from "eat" adds 116 to the sum.
<br>
At the end, both strings are equal, and 115 + 116 = 231 is the minimum sum possible to achieve this.

## Constraints

- `1 <= s1.length, s2.length <= 1000`
- `s1` and `s2` consist of lowercase English letters.
