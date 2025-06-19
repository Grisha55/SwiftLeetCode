//
// 0338. Counting Bits
// Problem: https://leetcode.com/problems/counting-bits/
// SwiftLeetCode
//

import Foundation

class Solution {
    func countBits(_ n: Int) -> [Int] {

        // Create an array to store the counts of set bits, initialized with zeros. The array size is n+1 to include 0 to n.
        var ans = [Int](repeating: 0, count: n + 1)

        // Handle the base case where n is 0; the array is already filled with zeros.
        if n == 0 { return ans }

        // Iterate from 1 to n (inclusive).
        for i in 1...n {

            // This is the clever part:
            // i >> 1: Right-shifts i by 1 bit. This is equivalent to integer division by 2. It effectively removes the least significant bit.
            // i & 1: Performs a bitwise AND operation between i and 1. This extracts the least significant bit (LSB). The LSB is 1 if i is odd, 0 if i is even.
            // ans[i >> 1] + (i & 1): This calculates the number of set bits in i. It reuses the previously calculated count of set bits in i/2 and adds 1 if i is odd.
            ans[i] = ans[i >> 1] + (i & 1)
        }

        // Return the array containing the counts of set bits for each number from 0 to n.
        return ans
    }
}

/*
Explanation in simple terms:

The function uses dynamic programming to avoid redundant calculations. It cleverly leverages the relationship between the number of set bits in a number and its half.

Let's illustrate with an example:

Consider `n = 5`. The binary representations are:

* 0: 0
* 1: 1
* 2: 10
* 3: 11
* 4: 100
* 5: 101

The function works as follows:

1. It creates an array `ans` to store the bit counts.
2. It iterates from 1 to n.
3. For each number `i`, it calculates the number of set bits using the formula `ans[i >> 1] + (i & 1)`.
   * `i >> 1` effectively divides `i` by 2, removing the last bit. The number of set bits in `i/2` is already calculated and stored in `ans[i >> 1]`.
   * `i & 1` checks if `i` is odd (LSB is 1). If it's odd, we add 1 to the count.

This approach is efficient because it avoids counting bits directly for each number. Instead, it reuses previously computed results, making the overall time complexity O(n).
*/
