//
// 0326. Power of Three
// Prblem: https://leetcode.com/problems/power-of-three/
// SwiftLeetCode
//

import Foundation

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {

        // Check if n is positive. Powers of three are always positive.
        return n > 0 && 1162261467 % n == 0
    }
}

/*
Explanation in simple terms:

The function relies on the fact that the largest power of three that fits within a 32-bit signed integer is 3^19 = 1162261467. Any other power of three will be a divisor of this number.

The code does the following:

1. `n > 0`: It first checks if `n` is greater than 0. Powers of three are always positive. If `n` is not positive, it cannot be a power of three.

2. `1162261467 % n == 0`: This is the core of the function. It checks if `n` is a divisor of 1162261467 (3<sup>19</sup>). If `n` is a power of three, it will perfectly divide 1162261467 without any remainder. The modulo operator (`%`) gives the remainder of a division. If the remainder is 0, then `n` divides 1162261467 evenly.

-------------------------------
Why this works:

Because 1162261467 is the largest power of 3 that can be represented as a 32-bit integer, *any* smaller power of 3 will necessarily be a factor (divisor) of it. If the number isn't a factor, it can't be a power of 3. This is a much more efficient approach than repeatedly dividing by 3 until you reach 1.

This method avoids looping and is therefore very fast. It's a neat trick to solve this problem efficiently.
*/
