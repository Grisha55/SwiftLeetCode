# 2428. Maximum Sum of an Hourglass

## Description

You are given an `m x n` integer matrix `grid`.

We define an hourglass as a part of the matrix with the following form:

Return the maximum sum of the elements of an hourglass.

Note that an hourglass cannot be rotated and must be entirely contained within the matrix.

## Example

**Input:**  
grid = [[6,2,1,3],[4,2,1,5],[9,2,8,7],[4,1,2,9]]
<br>
**Output:**
<br>
30
<br>
**Explanation:**
<br>
The cells shown above represent the hourglass with the maximum sum: 6 + 2 + 1 + 2 + 9 + 2 + 8 = 30.

## Constraints

- `m == grid.length`
- `n == grid[i].length`
- `3 <= m, n <= 150`
- `0 <= grid[i][j] <= 10^6`