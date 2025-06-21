# 2434. Using a Robot to Print the Lexicographically Smallest String

## Description

You are given a string `s` and a robot that currently holds an empty string `t`. Apply one of the following operations until `s` and `t` **are both empty**:

- Remove the **first** character of a string `s` and give it to the robot. The robot will append this character to the string `t`.
- Remove the **last** character of a string `t` and give it to the robot. The robot will write this character on paper.
Return the lexicographically smallest string that can be written on the paper

## Example

**Input:**  
s = "zza"
<br>
**Output:**
<br>
"azz"
<br>
**Explanation:**
<br>
Let p denote the written string.
<br>
Initially p="", s="zza", t="".
<br>
Perform first operation three times p="", s="", t="zza".
<br>
Perform second operation three times p="azz", s="", t="".

## Constraints

- `1 <= s.length <= 10^5`
- `s` consists of only English lowercase letters.
