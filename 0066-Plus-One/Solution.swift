//
//  0066. Plus One
//  Problem: https://leetcode.com/problems/plus-one/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var d = digits
        var n = d.count
        
        for i in (0..<n).reversed() {
            if d[i] < 9 {
                d[i] += 1
                return d
            }
            d[i] = 0
        }
        
        return [1] + Array(repeating: 0, count: n)
    }
}
