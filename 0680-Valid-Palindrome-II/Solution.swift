//
// 0680. Valid Palindrome II
// Problem: https://leetcode.com/problems/valid-palindrome-ii/
// SwiftLeetCode
//

import Foundation

class Solution {

    // Auxiliary function for recognize the palindrome
    func isPalindrom(_ left: Int, _ right: Int, _ chars: [Character]) -> Bool {
        var l = left
        var r = right

        // Compare the initial and final characters
        while l < r {
            if chars[l] != chars[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
    
    func validPalindrome(_ s: String) -> Bool {
        var chars = Array(s)
        var left = 0
        var right = chars.count - 1

        while left < right {
            if chars[left] != chars[right] {
                return isPalindrom(left + 1, right, chars) || isPalindrom(left, right - 1, chars)
            }
            left += 1
            right -= 1
        }
        return true
    }
}
