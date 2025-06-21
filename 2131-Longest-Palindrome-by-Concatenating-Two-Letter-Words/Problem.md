# 2131. Longest Palindrome by Concatenating Two Letter Words

## Description

You are given an array of strings `words`. Each element of `words` consists of **two** lowercase English letters.

Create the **longest possible palindrome** by selecting some elements from `words` and concatenating them in **any order**. Each element can be selected **at most once**.

Return the **length** of the longest palindrome that you can create. If it is impossible to create any palindrome, return `0`.

A **palindrome** is a string that reads the same forward and backward.

## Example

**Input:**  
words = ["lc","cl","gg"]
<br>
**Output:**
<br>
6
<br>
**Explanation:**
<br>
One longest palindrome is "lc" + "gg" + "cl" = "lcggcl", of length 6.
<br>
Note that "clgglc" is another longest palindrome that can be created.

## Constraints

- `1 <= words.length <= 10^5`
- `words[i].length == 2`
- `words[i]` consists of lowercase English letters.
