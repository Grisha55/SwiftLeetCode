//
// 1668. Maximum Repeating Substring
// Problem: https://leetcode.com/problems/maximum-repeating-substring/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxRepeating(_ sequence: String, _ word: String) -> Int {
        if word.isEmpty || sequence.isEmpty { return 0 }

        var count = 0
        var repeatedWord = word

        while sequence.contains(repeatedWord) {
            count += 1
            repeatedWord += word
        }

        return count
    }
}
