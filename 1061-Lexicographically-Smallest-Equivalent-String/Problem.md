# 1061. Lexicographically Smallest Equivalent String

## Description

You are given two strings of the same length `s1` and `s2` and a string `baseStr`.

We say `s1[i]` and `s2[i]` are equivalent characters.

- For example, if `s1 = "abc"` and `s2 = "cde"`, then we have `'a' == 'c'`, `'b' == 'd'`, and `'c' == 'e'`.
Equivalent characters follow the usual rules of any equivalence relation:

- **Reflexivity:** `'a' == 'a'`.
- **Symmetry:** `'a' == 'b'` implies `'b' == 'a'`.
- **Transitivity:** `'a' == 'b'` and `'b' == 'c'` implies `'a' == 'c'`.
For example, given the equivalency information from `s1 = "abc"` and `s2 = "cde"`, `"acd"` and `"aab"` are equivalent strings of `baseStr = "eed"`, and `"aab"` is the lexicographically smallest equivalent string of `baseStr`.

Return the lexicographically smallest equivalent string of `baseStr` by using the equivalency information from `s1` and `s2`.

## Example

**Input:**  
s1 = "parker", s2 = "morris", baseStr = "parser"
<br>
**Output:**
<br>
"makkek"
<br>
**Explanation:**
<br>
Based on the equivalency information in s1 and s2, we can group their characters as [m,p], [a,o], [k,r,s], [e,i].
<br>
The characters in each group are equivalent and sorted in lexicographical order.
<br>
So the answer is "makkek".

## Constraints

- `1 <= s1.length, s2.length, baseStr <= 1000`
- `s1.length == s2.length`
- `s1`, `s2`, and `baseStr` consist of lowercase English letters.
