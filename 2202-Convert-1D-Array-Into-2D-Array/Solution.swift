class Solution {
  func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
    // Step 1: Check if the original array can be converted to a 2D array
    if original.count != m * n {
      return []
    }

    // Step 2: Create a 2D array with m rows and n columns
    var result = [[Int]]()

    // Step 3: Fill the 2D array with elements from the original array
    for i in 0..<m {
      var row = [Int]()
      for j in 0..<n {
        row.append(original[i * n + j])
      }
      result.append(row)
    }

    // Step 4: Return the constructed 2D array
    return result
  }
}