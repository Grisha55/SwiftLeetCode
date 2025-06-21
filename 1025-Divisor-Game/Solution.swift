//
// 1025. Divisor Game
// Problem: https://leetcode.com/problems/divisor-game/
// SwiftLeetCode
//

import Foundation

class Solution {
    func divisorGame(_ n: Int) -> Bool {
        return n % 2 == 0
    }
}

/*
Conclusion: Alice wins if and only if n is an even number.

Why?
- If n is even, Alice can choose x = 1, and then n - x will be odd.
- Bob will then have to play with an odd number, and any number he chooses (being a divisor of an odd number) will again leave Alice with an even number.
- Thus, Alice can "give" odd numbers to Bob every time and eventually win.

📊 Complexity:
Time: O(1) — one check.
Memory: O(1) — no additional memory used.
*/
