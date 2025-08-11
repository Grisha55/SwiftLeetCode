class Solution {
  func specialGrid(_ n: Int) -> [[Int]] {
    // Base case: 1x1 grid
    if n == 0 {
      return [[0]]
    }
    let size = 1 << n // 2^n
    let half = size / 2
    let prev = specialGrid(n - 1)
    let offset = half * half
    var grid = Array(repeating: Array(repeating: 0, count: size), count: size)
    // Top-right quadrant: prev
    for i in 0..<half {
      for j in 0..<half {
        grid[i][j + half] = prev[i][j]
      }
    }
    // Bottom-right quadrant: prev + offset
    for i in 0..<half {
      for j in 0..<half {
        grid[i + half][j + half] = prev[i][j] + offset
      }
    }
    // Bottom-left quadrant: prev + 2*offset
    for i in 0..<half {
      for j in 0..<half {
        grid[i + half][j] = prev[i][j] + 2 * offset
      }
    }
    // Top-left quadrant: prev + 3*offset
    for i in 0..<half {
      for j in 0..<half {
        grid[i][j] = prev[i][j] + 3 * offset
      }
    }
    return grid
  }
}