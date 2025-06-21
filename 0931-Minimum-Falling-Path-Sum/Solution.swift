//
// 0931. Minimum Falling Path Sum
// Problem: https://leetcode.com/problems/minimum-falling-path-sum/
// SwiftLeetCode
//

import Foundation

class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        if n == 0 { return 0 }  // If the matrix is empty, return 0

        var dp = matrix  // Create a copy of the matrix to store minimal path sums

        for i in 1..<n { // Start from the second row
            for j in 0..<n { // Iterate through each column
                let above = dp[i - 1][j]  // Value from the cell directly above
                let ld = j > 0 ? dp[i - 1][j - 1] : Int.max  // Diagonally left above, or max if out of bounds
                let rd = j < n - 1 ? dp[i - 1][j + 1] : Int.max  // Diagonally right above, or max if out of bounds

                dp[i][j] += min(above, ld, rd)  // Add the minimum of the three to current cell
            }
        }

        return dp[n - 1].min()!  // Return the minimum value in the last row
    }
}

/*
🧠 Problem statement (in simple terms):
You are given a square two-dimensional array matrix, where matrix[i][j] is the cost of being on a cell in row i and column j.
You can start from any cell in the top row and move down. At each step, you can go down:
    - down (↓)
    - diagonally to the left (↙)
    - diagonally to the right (↘)

You need to find the smallest possible sum of the path if you go from the top row to the bottom.


🔍 Solution idea:
We use dynamic programming:
    - we create a copy of the matrix dp, where we will store the minimum sum of the path to each cell;
    - we start from the 1st row and update the values ​​on each subsequent row, taking into account 3 possible options for arrival (↑, ↖, ↗);
    - at the end, we choose the minimum value in the last row - this will be the answer.


🧮 Example:

let matrix = [
[2, 1, 3],
[6, 5, 4],
[7, 8, 9]
]
Minimum path:
1 (from [0][1]) → 4 (from [1][2]) → 8 (from [2][1]) = 1 + 4 + 8 = 13

📊 Complexity:
Time: O(n²) — we go through all elements of the matrix.

Memory: O(n²) — we store the matrix dp (can be optimized to O(n)).
*/
