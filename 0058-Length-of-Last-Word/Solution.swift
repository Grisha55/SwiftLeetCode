//
//  0058. Length of Last Word
//  Problem: https://leetcode.com/problems/length-of-last-word/
//  SwiftLeetCode
//

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var length = 0
        var hasStarted = false
        var chars = Array(s)

        for i in stride(from: chars.count - 1, through: 0, by: -1) {
            if chars[i] != " " {
                hasStarted = true
                length += 1
            } else if hasStarted {
                break
            }
        }
        return length
    }
}
