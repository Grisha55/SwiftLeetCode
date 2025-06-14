//
// 0013. Roman to Integer
// Problem: https://leetcode.com/problems/roman-to-integer/
// SwiftLeetCode
//

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        var romans: [Character: Int] = [
            "I" : 1,
            "V" : 5,
            "X" : 10,
            "L" : 50,
            "C" : 100,
            "D" : 500,
            "M" : 1000
        ]
        var sArr = Array(s)
        var res = 0
        for i in 0..<s.count {
            // Check if a smaller numeral comes before a large one
            if i + 1 < s.count && romans[sArr[i], default: 0] < romans[sArr[i + 1], default: 0] {
                res -= romans[sArr[i], default: 0]
            } else {
                res += romans[sArr[i], default: 0]
            }
        }
        return res
    }
}
