//
// 1394. Find Lucky Integer in an Array
// SwiftLeetCode
//

import Foundation

class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        var copies: [Int: Int] = [:] // dictionary for counting copies in array
        var ans = -1 // result value

        // Count how many times number exist in array
        for num in arr {
            copies[num, default: 0] += 1
        }

        // Check if number is equel to its count in array and take make with previous 'ans'
        for (key, value) in copies {
            if key == value {
                ans = max(ans, key)
            }
        }

        return ans
    }
}
