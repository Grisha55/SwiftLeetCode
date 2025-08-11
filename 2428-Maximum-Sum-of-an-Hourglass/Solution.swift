class Solution {
  func maxSum(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var maxSum = Int.min

    // Iterate through all possible hourglass starting points
    for i in 0..<m - 2 {
      for j in 0..<n - 2 {
        // Calculate the sum of the hourglass
        let hourglassSum = grid[i][j] + grid[i][j + 1] + grid[i][j + 2] +
                          grid[i + 1][j + 1] +
                          grid[i + 2][j] + grid[i + 2][j + 1] + grid[i + 2][j + 2]
        
        // Update maxSum if the current hourglass sum is greater
        if hourglassSum > maxSum {
          maxSum = hourglassSum
        }
      }
    }

    return maxSum
  }
}