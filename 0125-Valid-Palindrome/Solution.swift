//
// 0125. Valid Palindrome
// Problem:
// SwiftLeetCode
//

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        // Convert the string to an array of characters and convert to lower case:
        let chars = Array(s.lowercased())

        var left = 0 // points to the beginning of the line
        var right = chars.count - 1 // points to the end of the line

        // Start the loop: as long as the left pointer is less than the right pointer
        // Within this loop, we will move toward the center by comparing characters.
        while left < right {

            // Skip all non-letter and non-numeric characters:
            while left < right && !chars[left].isLetter && !chars[left].isNumber {
                left += 1
            }

            // Same thing on the right: (we skip spaces, commas, periods, etc.)
            while left < right && !chars[right].isLetter && !chars[right].isNumber {
                right -= 1
            }

            // Comparing Characters:
            // If they are not equal → it is not a palindrome, return false immediately.
            if chars[left] != chars[right] {
                return false
            }

            // If equal, move the pointers to the center:
            left += 1
            right -= 1
        }

        // If the whole cycle is passed - the string is a palindrome:
        return true
    }
}
