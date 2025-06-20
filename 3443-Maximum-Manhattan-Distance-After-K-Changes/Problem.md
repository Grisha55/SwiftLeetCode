# 3443. Maximum Manhattan Distance After K Changes

## Description

You are given a string `s` consisting of the characters `'N'`, `'S'`, `'E'`, and `'W'`, where `s[i]` indicates movements in an infinite grid:

- `'N'` : Move north by 1 unit.
- `'S'` : Move south by 1 unit.
- `'E'` : Move east by 1 unit.
- `'W'` : Move west by 1 unit.
Initially, you are at the origin `(0, 0)`. You can change **at most** `k` characters to any of the four directions.

Find the **maximum Manhattan distance** from the origin that can be achieved at **any time** while performing the movements **in order**.

The **Manhattan Distance** between two cells `(xi, yi)` and `(xj, yj)` is `|xi - xj| + |yi - yj|`.
 

## Example

**Input:**  
s = "NWSE", k = 1
<br>
**Output:**
<br>
3
<br>
**Explanation:**
<br>
Change s[2] from 'S' to 'N'. The string s becomes "NWNE". The maximum Manhattan distance from the origin that can be achieved is 3. Hence, 3 is the output.

## Constraints

- `1 <= s.length <= 10^5`
- `0 <= k <= s.length`
- `s` consists of only `'N'`, `'S'`, `'E'`, and `'W'`.
