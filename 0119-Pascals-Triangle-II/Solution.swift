//
// 0119. Pascal's Triangle II
// Problem: https://leetcode.com/problems/pascals-triangle-ii/
// SwiftLeetCode
//

import Foundation

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] } // If the first line (null) is asked for, return [1].
        var rows: [Int] = [1] // An array to which we will add the numbers of the current row.
        var c = 1 // is the current value of the binomial coefficient (using the formula we discuss below).

        // Formula: C(n, k) = C(n, k-1) * (n - k + 1) / k
        // Each next number is counted on the basis of the previous one!
        // This is the optimal way to read a string of Pascal's triangle without creating the entire structure.
        for i in 1...rowIndex {
            c = c * (rowIndex - i + 1) / i
            rows.append(c)
        }

        return rows
    }
}
