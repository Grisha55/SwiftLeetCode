//
//  0042. Group Anagrams
//  Problem: https://leetcode.com/problems/group-anagrams/
//  SwiftLeetCode
//

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var resultDict: [String: [String]] = [:]
        
        for str in strs {
            let key = String(str.sorted())
            resultDict[key, default: []].append(str)
        }
        
        return Array(resultDict.values)
    }
}
