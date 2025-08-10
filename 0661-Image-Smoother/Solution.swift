class Solution {
  func imageSmoother(_ img: [[Int]]) -> [[Int]] {
    // Step 1: Get the dimensions of the input image
    let rows = img.count
    let cols = img[0].count
    
    // Step 2: Create a result array with the same dimensions, initialized to zero
    var result = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    
    // Step 3: Iterate through each pixel in the image
    for r in 0..<rows {
      for c in 0..<cols {
        // Step 4: Calculate the sum and count of valid neighbors
        var sum = 0
        var count = 0
        
        // Check all neighbors including the pixel itself
        for dr in -1...1 {
          for dc in -1...1 {
            let nr = r + dr
            let nc = c + dc
            
            // Ensure the neighbor is within bounds
            if nr >= 0 && nr < rows && nc >= 0 && nc < cols {
              sum += img[nr][nc]
              count += 1
            }
          }
        }
        
        // Step 5: Calculate the average and assign it to the result pixel
        result[r][c] = sum / count
      }
    }
    
    // Step 6: Return the smoothed image
    return result
  }
}