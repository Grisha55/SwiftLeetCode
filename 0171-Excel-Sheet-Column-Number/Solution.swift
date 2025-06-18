//
// 0171. Excel Sheet Column Number
// Problem: https://leetcode.com/problems/excel-sheet-column-number/
// SwiftLeetCode
//

import Foundation

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var result = 0 // final result

        // We go by each letter of the column name.
        for c in columnTitle {

            // Each letter from ‘A’ to ‘Z’ is like a digit in the 26-character number system
            // Character("A").asciiValue! - is 65.
            // If the letter 'C' → ascii = 67, then 67 - 65 + 1 = 3 → 'C' is the 3rd letter of the alphabet, everything is correct.
            let d = Int(c.asciiValue! - Character("A").asciiValue! + 1)

            // It's like adding numbers in decimal, only with a base of 26.
            result = result * 26 + d
        }

        return result
    }
}
