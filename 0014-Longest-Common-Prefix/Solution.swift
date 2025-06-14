//
//  0014. Longest Common Prefix
//  Problem: https://leetcode.com/problems/longest-common-prefix/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // If there is one string in the array - it's the common prefix
        if strs.count == 1 { return strs[0] }
        
        // Get the last line (any line can be taken)
        guard var pr = strs.last else { return "" }
        
        // Sort the rows so that the order is predictable
        let sortedStrs = strs.sorted()
        
        for str in sortedStrs {
            // If string is empty - there is no common prefix
            if str.count < 1 { return "" }
            
            // As long as the current string doesn't start with a prefix - short the prefix
            while !str.hasPrefix(pr) {
                pr.removeLast()
                if pr.isEmpty { return "" }
            }
        }
        return pr
    }
}

