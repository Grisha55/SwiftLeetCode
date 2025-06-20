//
// 0374. Guess Number Higher or Lower
// Problem: https://leetcode.com/problems/guess-number-higher-or-lower/
// SwiftLeetCode
//

import Foundation

/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if num is higher than the picked number
 *                  1 if num is lower than the picked number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {

        // Smallest and largest boundary
        var l = 1
        var r = n

        // Using binary search for searching the number
        while l <= r {
            let mid = (l + r) / 2
            let result = guess(mid)
            if result == 0 { // Find picked number
                return mid
            } else if result == -1 {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return -1
    }
}
