class Solution {
  func setZeroes(_ matrix: inout [[Int]]) {
    let rows = matrix.count
    let cols = matrix[0].count
    var zeroRows = Set<Int>()
    var zeroCols = Set<Int>()

    // First pass: record all rows and columns that need to be zeroed
    for r in 0..<rows {
      for c in 0..<cols {
        if matrix[r][c] == 0 {
          zeroRows.insert(r)
          zeroCols.insert(c)
        }
      }
    }

    // Second pass: set cells to zero if their row or column is marked
    for r in 0..<rows {
      for c in 0..<cols {
        if zeroRows.contains(r) || zeroCols.contains(c) {
          matrix[r][c] = 0
        }
      }
    }

    // Step 7: Reset the zero sets for the next row
    zeroRows.removeAll()
    zeroCols.removeAll()
  }
}
