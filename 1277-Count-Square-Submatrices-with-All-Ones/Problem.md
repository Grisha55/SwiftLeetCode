# 1277. Count Square Submatrices with All Ones

## Description

Given a m \* n matrix of ones and zeros, return how many square submatrices have all ones.

## Example

**Input:**
Input: matrix =  
[  
 [0,1,1,1],  
 [1,1,1,1],  
 [0,1,1,1]  
]  
<br>
**Output:**
<br>
15
<br>
**Explanation:**
<br>
There are 10 squares of side 1.  
There are 4 squares of side 2.  
There is 1 square of side 3.  
Total number of squares = 10 + 4 + 1 = 15.

## Constraints

- `1 <= arr.length <= 300`
- `1 <= arr[0].length <= 300`
- `0 <= arr[i][j] <= 1`
