# 0696. Count Binary Substrings

## Description

Given a binary string s, return the number of non-empty substrings that have the same number of 0's and 1's, and all the 0's and all the 1's in these substrings are grouped consecutively.

Substrings that occur multiple times are counted the number of times they occur.

## Example

**Input:**
s = "00110011"
<br>
**Output:**
<br>
6
<br>
**Explanation:**
<br>
There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
Notice that some of these substrings repeat and are counted the number of times they occur.
Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.

## Constraints

- `1 <= s.length <= 10^5`
- `s[i]` is either `'0'` or `'1'`.
