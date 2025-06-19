//
// 0342. Power of Four
// Problem: https://leetcode.com/problems/power-of-four/
// SwiftLeetCode
//

import Foundation

class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        // Check if n is a positive integer. Powers of four are always positive and at least 1.
        return n >= 1 &&

            // Check if n is a power of two. Powers of four are also powers of two. This condition ensures only one bit is set.
            (n & (n - 1)) == 0 &&

            // Check if the set bit is at an even position (0-based index).
           // 0xAAAAAAAA is a hexadecimal constant where bits at even positions are set (10101010...).
           // The bitwise AND operation will be zero only if the only set bit in n is at an odd position.
            n & 0xAAAAAAAA == 0
    }
}

/*
Explanation in simple terms:

The function employs three bitwise checks to determine if `n` is a power of four:

1. `n >= 1`: This ensures that the input `n` is a positive integer. Powers of four are always positive and at least 1 (4⁰ = 1).

2. `(n & (n - 1)) == 0`: This condition checks if `n` is a power of two. A power of two has only one bit set to 1 in its binary representation (e.g., 4 = 100, 16 = 10000). Subtracting 1 from a power of two flips all bits to the right of the single set bit. The bitwise AND operation (`&`) will result in 0 only if there was only one bit set initially.

3. `n & 0xAAAAAAAA == 0`: This condition verifies that the single set bit in `n` (from the previous check) is at an even position (0-based index). The hexadecimal constant `0xAAAAAAAA` has bits set at all even positions. If the bitwise AND operation with `n` results in 0, it means that `n` has no bits set at even positions. Therefore, the only set bit must be at an odd position. However, powers of four *always* have their single set bit at an *even* position (e.g., 4 = 100, 16 = 10000, 64 = 1000000), so this condition is actually checking for the *absence* of a power of four where the bit is at an odd position. It acts as a filter.

If all three conditions are true, then `n` is a power of four. This method is significantly faster than iterative division because it uses only bitwise operations which are very efficient.
*/
