//
// 0383. Ransom Note
// Problem: https://leetcode.com/problems/ransom-note/
// SwiftLeetCode
//

import Foundation

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        // Dictionary for counting characters in the word 'magazine'
        var magazineDict: [Character:Int] = [:]

        // Add chars and their count into dictionary
        for char in magazine {
            magazineDict[char, default: 0] += 1
        }

        // Check if characters in 'ransomNote' is in 'magazineDict' (magazine)
        for char in ransomNote {
            if magazineDict[char, default: 0] < 1 {
                return false
            } else {
                magazineDict[char, default: 0] -= 1
            }
        }
        return true
    }
}
