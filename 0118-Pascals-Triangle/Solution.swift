//
// 0118. Pascal's Triangle
// Problem: https://leetcode.com/problems/pascals-triangle/
// SwiftLeetCode
//

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var answer: [[Int]] = []

        for row in 0..<numRows {
            var currentRow: [Int] = []
            var c = 1 // c = 1 is the first element of each row (always 1).

            for i in 0...row {
                currentRow.append(c)
                c = c * (row - i) / (i + 1) // Binomial coefficient formula: "C(n, k) = C(n, k - 1) * (n - k + 1) / k"
            }

            answer.append(currentRow)
        }

        return answer
    }
}
