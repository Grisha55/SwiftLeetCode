class Solution {
  func matrixScore(_ grid: [[Int]]) -> Int {
    // Step 1: Get the dimensions of the grid
    let m = grid.count
    let n = grid[0].count

    // Step 2: Create a mutable copy of the grid to manipulate
    var mutableGrid = grid

    // Step 3: Ensure the first column is all 1's
    for i in 0..<m {
      if mutableGrid[i][0] == 0 {
        for j in 0..<n {
          mutableGrid[i][j] = 1 - mutableGrid[i][j] // Flip the row
        }
      }
    }

    // Step 4: Calculate the score for each column
    var score = 0
    for j in 0..<n {
      var countOnes = 0
      for i in 0..<m {
        if mutableGrid[i][j] == 1 {
          countOnes += 1
        }
      }

      // Step 5: Determine the maximum value for this column
      let maxCount = max(countOnes, m - countOnes)
      score += maxCount * (1 << (n - j - 1)) // Multiply by the power of 2 based on column index
    }

    return score
  }
}