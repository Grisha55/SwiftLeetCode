//
// 0771. Jewels and Stones
// Problem: https://leetcode.com/problems/jewels-and-stones/
// SwiftLeetCode
//

import Foundation

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let setJewels = Set(jewels) // set because we can do operations with O(1)
        var result = 0 // final result

        for stone in stones {
            if setJewels.contains(stone) {
                result += 1
            }
        }

        // Return final result
        return result
    }
}
