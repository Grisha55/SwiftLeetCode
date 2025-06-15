## Problem: Longest Palindromic Substring

### Description

Given a string `s`, return the **longest palindromic substring** in `s`.

A palindrome is a string that reads the same forward and backward.

### Example

**Input:**
`s = "babad"`
**Output:**
`"bad"`

---

### Constraints

- `1 <= s.length <= 1000`
- `s` consists of only digits and English letters (lower-case and/or upper-case).

---

### Approach

The algorithm expands around the center of potential palindromes.

For each character in the string:
- Consider it as the center of an odd-length palindrome.
- Consider the character and its right neighbor as the center of an even-length palindrome.
- Expand as long as the characters on both sides are the same.
- Keep track of the longest palindrome found.

Time Complexity: `O(n^2)`  
Space Complexity: `O(1)` (ignoring the space used for the output string)

