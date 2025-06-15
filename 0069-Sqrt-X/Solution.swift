//
//  0069. Sqrt(x)
//  Problem: https://leetcode.com/problems/sqrtx/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x < 2 { return x }

        var left = 1
        var right = x / 2
        var result = 0

        while left <= right {
            let mid = left + (right - left) / 2

            // Compair mid with x / mid, to avoid overflow
            if mid <= x / mid {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return result
    }

}
