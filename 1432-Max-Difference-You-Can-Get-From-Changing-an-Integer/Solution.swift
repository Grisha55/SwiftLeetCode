//
// 1432. Max Difference You Can Get From Changing an Integer
// Problem: https://leetcode.com/problems/max-difference-you-can-get-from-changing-an-integer/?envType=daily-question&envId=2025-06-15
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxDiff(_ num: Int) -> Int {
        let str = String(num)

        // Try to make the number as big as possible:
        var maxNum = str
        for ch in str {
            if ch != "9" {
                // Replace all instances of ch with "9"
                maxNum = str.map { String($0 == ch ? "9" : $0) }.joined()
                break
            }
        }

        // Try to make the number as small as possible:
        var minNum = str
        let firstChar = str.first!

        if firstChar != "1" {
            // Replace all instances of first digit with "1"
            minNum = str.map { String($0 == firstChar ? "1" : $0) }.joined()
        } else {
            // Start from second digit, replace first eligible digit with "0"
            for ch in str.dropFirst() {
                if ch != "0" && ch != "1" {
                    minNum = str.map { String($0 == ch ? "0" : $0) }.joined()
                    break
                }
            }
        }

        return Int(maxNum)! - Int(minNum)!
    }
}

