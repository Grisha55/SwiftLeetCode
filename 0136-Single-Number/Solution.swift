//
// 0136. Single Number
// Problem: https://leetcode.com/problems/single-number/
// SwiftLeetCode
//

import Foundation

class Solution {

    /*
        Simple idea:
        - The bitwise exclusive OR (^, read as XOR) operation is used.
        - XOR has a magical property:
            1. a ^ a = 0 - if two numbers are the same, they "zero out".
            2. a ^ 0 = a - zero does not change the number.
            3. The operation is commutative and associative, i.e. order is not important.
    */

    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0 // final result

        // Go through all numbers and apply XOR between the current result and num.
        // All paired numbers are mutually eliminated.
        // Only the number that occurs once remains.
        for num in nums {
            result ^= num
        }
        
        return result
    }
}
