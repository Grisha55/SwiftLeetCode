//
// 0389. Find the Difference
// Problem: https://leetcode.com/problems/find-the-difference/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        // Initialize result to 0 as a base for XOR operations
        var result: UInt8 = 0

        // XOR all characters from the first string
        for char in s.utf8 {
            result ^= char
        }

        // XOR all characters from the second string
        for char in t.utf8 {
            result ^= char
        }

        // The result is the ASCII value of the extra character
        return Character(UnicodeScalar(result))
    }
}

/*
🧠 Simple explanation:

What does the ^ (XOR) operator do?
XOR is a bitwise operation that has an interesting property:

A B A ^ B
0 0 0
1 0 1
0 1 1
1 1 0

If two numbers are the same, the result is 0. If they are different, the result is 1.

How does this help?
If we XOR all characters from s and t, then:
    - identical characters will "destroy" each other (A ^ A = 0)
    - only the extra character will remain, because it has no pair

🔍 Step-by-step example:
s = "abcd"
t = "abcde"

In Unicode:
    a = 97
    b = 98
    c = 99
    d = 100
    e = 101

Result:
XOR all characters: 97 ^ 98 ^ 99 ^ 100 ^ 97 ^ 98 ^ 99 ^ 100 ^ 101 = 101
This is 'e'.
*/
