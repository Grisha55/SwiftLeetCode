//
// 0006. Zigzag Conversion
// Problem: https://leetcode.com/problems/zigzag-conversion/
// SwiftLeetCode
//

import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        // If there's only one row, return the original string
        if numRows == 1 || s.count <= numRows {
            return s
        }
        
        // Create an array of strings for each row
        var rows = Array(repeating: "", count: numRows)
        
        // Index of current row we are filling
        var currentRow = 0
        
        // Boolean flag to determine direction (down or up)
        var goingDown = false
        
        // Loop through each character in the input string
        for char in s {
            // Append character to the current row
            rows[currentRow] += String(char)
            
            // If we're at the top or bottom row, reverse direction
            if currentRow == 0 || currentRow == numRows - 1 {
                goingDown.toggle()
            }
            
            // Move up or down depending on direction
            currentRow += goingDown ? 1 : -1
        }
        
        // Combine all rows into a single string
        return rows.joined()
    }
}

