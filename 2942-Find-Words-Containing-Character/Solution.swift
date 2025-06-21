//
// 2942. Find Words Containing Character
// Problem: https://leetcode.com/problems/find-words-containing-character/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        var result: [Int] = []
        var i = 0
        while i < words.count {
            if words[i].contains(x) {
                result.append(i)
            }
            i += 1
        }
        return result
    }
}
