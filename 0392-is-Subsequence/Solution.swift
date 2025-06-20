//
// 0392. Is Subsequence
// Problem: https://leetcode.com/problems/is-subsequence/
// SwiftLeetCode
//

import Foundation

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        // Convert string s to an array of characters
        var a = Array(s)

        // Convert string t to an array of characters
        var b = Array(t)

        // i is a pointer for string a (s)
        var i = 0

        // j is a pointer for string b (t)
        var j = 0

        // Loop through both arrays until one of them ends
        while i < a.count && j < b.count {
            // If characters match, move pointer i
            if a[i] == b[j] {
                i += 1
            }
            // Always move pointer j
            j += 1
        }

        // If we have matched all characters in s, return true
        return i == a.count
    }
}

/*
🔍 Example of work:
s = "abc"
t = "ahbgdc"

→ compare:
a == a → i = 1
b != h → i = 1
b == b → i = 2
c != g → i = 2
c != d → i = 2
c == c → i = 3

i == 3 → s is a complete match → return true
*/
