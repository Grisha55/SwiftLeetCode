# 2375. Construct Smallest Number From DI String

## Description

You are given a 0-indexed string pattern of length n consisting of the characters 'I' meaning increasing and 'D' meaning decreasing.

A 0-indexed string num of length n + 1 is created using the following conditions:

- num consists of the digits '1' to '9', where each digit is used at most once.
- If pattern[i] == 'I', then num[i] < num[i + 1].
- If pattern[i] == 'D', then num[i] > num[i + 1].
  Return the lexicographically smallest possible string num that meets the conditions.

## Example

**Input:**
pattern = "IIIDIDDD"
<br>
**Output:**
<br>
"123549876"
<br>
**Explanation:**
<br>
At indices 0, 1, 2, and 4 we must have that num[i] < num[i+1].  
At indices 3, 5, 6, and 7 we must have that num[i] > num[i+1].  
Some possible values of num are "245639871", "135749862", and "123849765".  
It can be proven that "123549876" is the smallest possible num that meets the conditions.  
Note that "123414321" is not possible because the digit '1' is used more than once.

## Constraints

- `1 <= pattern.length <= 8`
- `pattern` consists of only the letters `'I'` and `'D'`.
