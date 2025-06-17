//
// 0139. Word Break
// Problem: https://leetcode.com/problems/word-break/
// SwiftLeetCode
//

import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let n = s.count // length of input string
        let chars = Array(s) // chars from string s
        let wordSet = Set(wordDict) // Set of words from `wordDict`. Sets provide a quick search (checking if a word exists).
        let maxLength = wordDict.map { $0.count }.max() ?? 0 // max length of the word in dict
        // This is an optimization: we don't need to check substrings longer than the longest word.
        
        // `dp` is an array of boolean values of size `n + 1`.
        // `dp[i]` will be `true` if the substring `s[0...i-1]` can be split into dictionary words, and `false` otherwise.
        var dp = Array(repeating: false, count: n + 1)
        dp[0] = true // empty string can be segmented
        
        for i in 1...n {
            
            // We start the check at position `j`, which cannot be greater than `i - maxLength`
            // (otherwise the substring will be longer than the longest word in the dictionary).
            let start = max(0, i - maxLength)
            
            // This loop tries all possible points of splitting the substring `s[0...i-1]` into two parts:
            // `s[0...j-1]` and `s[j...i-1]`.
            for j in start..<i {
                
                // We check if the left part of `s[0...j-1]` can be split into words from the dictionary
                if dp[j] {
                    let substring = String(chars[j..<i]) // Extract the right side of the substring.
                    if wordSet.contains(substring) { // We check to see if the right part is in the dictionary.
                        
                        // If both parts can be broken into words
                        // (`dp[j]` and `substring` in the dictionary), then `dp[i]` is set to `true` and the inner loop is broken
                        dp[i] = true
                        
                        // (`break`) because we found a way to break the substring.
                        break
                    }
                }
            }
        }
        // The value `dp[n]` is returned. If it is `true`,
        // it means that the whole string `s` can be split into dictionary words.
        return dp[n]
    }
    
}
