//
// 0012. Integer to Roman
// Task: https://leetcode.com/problems/integer-to-roman/description/
// SwiftLeetCode
//

class Solution {
    func intToRoman(_ num: Int) -> String {
        var ans = ""
        var num = num
        let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

        for i in 0..<values.count {
            while num >= values[i] {
                num -= values[i]
                ans += symbols[i]
            }
        }

        return ans
    }
}

/*
Time Complexity - O(1)
Space Complexity - O(1)
*/
