//
// 0386. Lexicographical Numbers
// Problem: https://leetcode.com/problems/lexicographical-numbers/
// SwiftLeetCode
//

import Foundation

class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        // Create the result array
        var result: [Int] = []

        // Start from number 1
        var cur = 1

        // Loop n times to generate n numbers
        for i in 1...n {
            // Add current number to the result
            result.append(cur)

            // If going deeper (add 0 at the end) is valid and within bounds
            if cur * 10 <= n {
                cur *= 10
            } else {
                // If current is equal or greater than n, go up
                if cur >= n {
                    cur /= 10
                }

                // While we can't go to the next valid sibling, move up
                while cur % 10 == 9 || cur + 1 > n {
                    cur /= 10
                }

                // Go to the next sibling number
                cur += 1
            }
        }

        // Return the final result
        return result
    }
}

/*
📌 Solution idea:
We do not sort, but build numbers according to the rules of the lexicographic tree (Trie):
    - We start with 1.
    - If possible, we move to the "child" node (cur * 10) - for example, from 1 to 10.
    - If not, we try to move to the "neighboring" (cur + 1), but if it goes beyond the limits, we go up (cur /= 10) until we find a suitable "brother" node.
    - We repeat up to n numbers.
*/
