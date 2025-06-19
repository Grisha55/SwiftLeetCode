//
// 0231. Power of Two
// Problem: https://leetcode.com/problems/power-of-two/
// SwiftLeetCode
//

import Foundation

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {

        // Any number less than or equal to zero cannot be a power of two, so we immediately return false.
        if n <= 0 {
            return false
        }

        // A number that is a power of two appears in binary as one 1 followed by zeros.
        return (n & (n - 1)) == 0
    }

    /*
        Example:
        1 -> 0001
        2 -> 0010
        3 -> 0100
        4 -> 1000

        If we subtract 1, that one "1" will become a "0", and all the bits after it will become "1":
            n = 4 (0100), n - 1 = 3 (0011)
            n = 8 (1000), n - 1 = 7 (0111)

        If we apply the bitwise & operation, we get 0:
            4 & 3 = 0100 & 0011 = 0000 ✅
            8 & 7 = 1000 & 0111 = 0000 ✅

        But if the number is not a power of two, the result will not be zero.
    */
}
