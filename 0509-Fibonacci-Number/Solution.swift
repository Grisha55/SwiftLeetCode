//
// 0509. Fibonacci Number
// Problem: https://leetcode.com/problems/fibonacci-number/
// SwiftLeetCode
//

import Foundation

class Solution {
    func fib(_ n: Int) -> Int {
        var fibs: [Int] = [0, 1] // Array of Fibonacci numbers with first nums (0, 1)
        if n < 2 { return n } // Check if n < 2 return the result

        // Starting from 2 to n
        for i in 2...n {
            // Add sum of last number and previous number
            fibs.append(fibs[i - 1] + fibs[i - 2])
        }

        // Return the last value of the array with Fibonacci numbers
        return fibs.last ?? -1
    }
}
