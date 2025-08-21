# 1504. Count Submatrices With All Ones

## Description

Given an m x n binary matrix mat, return the number of submatrices that have all ones.

## Example

**Input:**
mat = [[1,0,1],[1,1,0],[1,1,0]]
<br>
**Output:**
<br>
13
<br>
**Explanation:**
<br>
There are 6 rectangles of side 1x1.  
There are 2 rectangles of side 1x2.  
There are 3 rectangles of side 2x1.  
There is 1 rectangle of side 2x2.  
There is 1 rectangle of side 3x1.  
Total number of rectangles = 6 + 2 + 3 + 1 + 1 = 13.

## Constraints

- `1 <= m, n <= 150`
- `mat[i][j]` is either `0` or `1`.
