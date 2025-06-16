# 91. Decode Ways

## Description

A message containing letters from A-Z can be encoded into numbers using the following mapping:

- 'A' -> "1"
- 'B' -> "2"
- ...
- 'Z' -> "26"

Given a string `s`, return the total number of ways to decode it.

## Example

**Input:**
<br>
s = "226"
<br>
**Output:**
<br>
3
<br>
**Explanation:**
<br>
- "2 2 6" → "BBF"
- "22 6" → "VF"
- "2 26" → "BZ"

## Constraints

- `1 <= s.length <= 100`
- `s` contains only digits and may contain leading zeros.
