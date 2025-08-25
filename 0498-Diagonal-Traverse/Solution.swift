class Solution {
  func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
    let m = mat.count
    let n = mat[0].count
    var result = [Int]()
    result.reserveCapacity(m * n)
    
    for d in 0..<(m + n - 1) {
      if d % 2 == 0 {
        var r = min(d, m - 1)
        var c = d - r
        while r >= 0 && c < n {
          result.append(mat[r][c])
          r -= 1
          c += 1
        }
      } else {
        var c = min(d, n - 1)
        var r = d - c
        while c >= 0 && r < m {
          result.append(mat[r][c])
          r += 1
          c -= 1
        }
      }
    }
    
    return result
  }
}