# 1260. Shift 2D Grid

## Description

Given a 2D grid of size m x n and an integer k. You need to shift the grid k times.

In one shift operation:

- Element at grid[i][j] moves to grid[i][j + 1].
- Element at grid[i][n - 1] moves to grid[i + 1][0].
- Element at grid[m - 1][n - 1] moves to grid[0][0].
Return the 2D grid after applying shift operation k times.



## Example

**Input:**  
grid = [[1,2,3],[4,5,6],[7,8,9]], k = 1
<br>
**Output:**
<br>

<br>
**Explanation:**
<br>
[[9,1,2],[3,4,5],[6,7,8]]

## Constraints

- `m == grid.length` 
- `n == grid[i].length` 
- `1 <= m <= 50` 
- `1 <= n <= 50` 
- `-1000 <= grid[i][j] <= 1000` 
- `0 <= k <= 100` 