# 3537. Fill a Special Grid

## Description

You are given a non-negative integer `n` representing a `2n x 2n` grid. You must fill the grid with integers from 0 to `2^2n - 1` to make it special. A grid is special if it satisfies all the following conditions:

- All numbers in the top-right quadrant are smaller than those in the bottom-right quadrant.
- All numbers in the bottom-right quadrant are smaller than those in the bottom-left quadrant.
- All numbers in the bottom-left quadrant are smaller than those in the top-left quadrant.
- Each of its quadrants is also a special grid.
Return the special `2n x 2n` grid.

Note: Any 1x1 grid is special.



## Example

**Input:**  
 n = 0
<br>
**Output:**
<br>
[[0]]
<br>
**Explanation:**
<br>
The only number that can be placed is 0, and there is only one possible position in the grid.

## Constraints

- `0 <= n <= 10`