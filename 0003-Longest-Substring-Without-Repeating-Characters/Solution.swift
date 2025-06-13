// 0003-Longest-Substring-Without-Repeating-Characters
// Problem: https://leetcode.com/problems/longest-substring-without-repeating-characters/

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var sSet: Set<Character> = []
    var sArr = Array(s)
    var left = 0
    var maxLenght = 0
    
    for right in 0..<sArr.count {
        while sSet.contains(sArr[right]) {
            sSet.remove(sArr[left])
            left += 1
        }
        
        sSet.insert(sArr[right])
        maxLenght = max(maxLenght, right - left + 1)
    }
    
    return maxLenght
}
