//
// 1528. Shuffle String
// Problem: https://leetcode.com/problems/shuffle-string/
// SwiftLeetCode
//

import Foundation

class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var sArr = Array(s)
        
        // Result array with length of s.count of empty Characteres
        var res: [Character] = Array(repeating: " ", count: sArr.count)

        for i in 0..<sArr.count {
            res[indices[i]] = sArr[i] // Replace char into right place
        }
        
        // Transform array int string
        return String(res)
    }
}
