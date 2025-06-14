//
//  2566. Maximum Difference by Remapping a Digit
//  Problem: https://leetcode.com/problems/maximum-difference-by-remapping-a-digit/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func minMaxDifference(_ num: Int) -> Int {
        let s = String(num)
        var maxVal = num
        var minVal = num

        // Replace the first non-9 digit with 9 to get the maximum
        for ch in s {
            if ch != "9" {
                let replaced = s.map { $0 == ch ? "9" : $0 }
                maxVal = Int(String(replaced))!
                break
            }
        }

        // Replace the first non-0 digit with 0 to get the minimum
        for ch in s {
            if ch != "0" {
                let replaced = s.map { $0 == ch ? "0" : $0 }
                minVal = Int(String(replaced))!
                break
            }
        }

        return maxVal - minVal
    }
}

