# 3033. Modify the Matrix

## Description

Given a 0-indexed m x n integer matrix matrix, create a new 0-indexed matrix called answer. Make answer equal to matrix, then replace each element with the value -1 with the maximum element in its respective column.

Return the matrix answer.

## Example

**Input:**  
matrix = [[1,2,-1],[4,-1,6],[7,8,9]]
<br>
**Output:**
<br>
[[1,2,9],[4,8,6],[7,8,9]]
<br>
**Explanation:**
<br>
The diagram above shows the elements that are changed (in blue).
- We replace the value in the cell [1][1] with the maximum value in the column 1, that is 8.
- We replace the value in the cell [0][2] with the maximum value in the column 2, that is 9.

## Constraints

- `m == matrix.length`
- `n == matrix[i].length`
- `2 <= m, n <= 50`
- `-1 <= matrix[i][j] <= 100`
- The input is generated such that each column contains at least one non-negative integer.