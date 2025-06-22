# 3170. Lexicographically Minimum String After Removing Stars

## Description

You are given a string `s`. It may contain any number of `'*'` characters. Your task is to remove all `'*'` characters.

While there is a `'*'`, do the following operation:

- Delete the leftmost `'*'` and the **smallest** non-`'*'` character to its left. If there are several smallest characters, you can delete any of them.
Return the lexicographically smallest resulting string after removing all `'*'` characters.

## Example

**Input:**  
s = "aaba*"
<br>
**Output:**
<br>
"aab"
<br>
**Explanation:**
<br>
We should delete one of the `'a'` characters with `'*'`. If we choose `s[3]`, `s` becomes the lexicographically smallest.

## Constraints

- `1 <= s.length <= 10^5`
- `s` consists only of lowercase English letters and `'*'`.
- The input is generated such that it is possible to delete all `'*'` characters.
