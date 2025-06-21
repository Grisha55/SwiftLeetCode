//
// 2900. Longest Unequal Adjacent Groups Subsequence I
// Problem: https://leetcode.com/problems/longest-unequal-adjacent-groups-subsequence-i/
// SwiftLeetCode
//

import Foundation

class Solution {
    func getLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        var answer: [String] = []
        var lastGroup: Int? = nil

        for i in 0..<words.count {
            if lastGroup == nil || groups[i] != lastGroup {
                answer.append(words[i])
                lastGroup = groups[i]
            }
        }

        return answer
    }
}
