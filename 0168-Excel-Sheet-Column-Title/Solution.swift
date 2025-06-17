//
// 0168. Excel Sheet Column Title
// Problem: https://leetcode.com/problems/excel-sheet-column-title/
// SwiftLeetCode
//

import Foundation

class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var n = columnNumber // column number
        var r = "" // final result value

        // The loop continues as long as the number `n` is greater than 0.
        // This means that we still need to process the numbers in base 26.
        while n > 0 {
            n -= 1 // This is important because we want 'A' to match 1, 'B' to match 2, and so on.

            // (n % 26) We calculate the remainder of dividing `n` by 26. This remainder will determine the letter.
            // (n % 26 + 25) We add 65 (ASCII code of the letter 'A') to the remainder. This allows us to convert the numeric remainder into the ASCII code of the corresponding letter.
            // Character(UnicodeScalar(...)!) - Convert the ASCII code to the `Character` symbol.
            let c = Character(UnicodeScalar(n % 26 + 65)!)

            // The resulting `c` character is added to the beginning of the `r` string. This is important because we build the column notation from right to left (similar to how we write numbers in the decimal system).
            r = String(c) + r

            // The number `n` is divisible by 26. This allows us to move on to the next digit in the base 26 number system.
            n /= 26
        }

        // After the loop completes, the string `r` contains the full column letter designation returned by the function.
        return r
    }
}
