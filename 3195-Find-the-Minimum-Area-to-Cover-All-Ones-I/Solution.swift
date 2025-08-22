class Solution {
  func minimumArea(_ grid: [[Int]]) -> Int {
    var minX = Int.max, maxX = Int.min
    var minY = Int.max, maxY = Int.min
    
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == 1 {
          minX = min(minX, i)
          maxX = max(maxX, i)
          minY = min(minY, j)
          maxY = max(maxY, j)
        }
      }
    }
    
    return (maxX - minX + 1) * (maxY - minY + 1)
  }
}