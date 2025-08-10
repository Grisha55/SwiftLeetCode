class Solution {
  func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
    let m = grid.count
    let n = grid[0].count
    var result = Array(repeating: Array(repeating: 0, count: n), count: m)

    // Calculate the total number of elements
    let totalElements = m * n

    // Calculate the effective shifts needed
    let effectiveK = k % totalElements

    // Iterate through each element in the grid
    for i in 0..<m {
      for j in 0..<n {
        // Calculate the new position after shifting
        let currentIndex = i * n + j
        let newIndex = (currentIndex + effectiveK) % totalElements

        // Calculate the new row and column indices
        let newRow = newIndex / n
        let newCol = newIndex % n

        // Assign the value to the new position in the result grid
        result[newRow][newCol] = grid[i][j]
      }
    }

    return result
  }
}