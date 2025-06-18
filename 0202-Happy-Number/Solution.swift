//
// 0202. Happy Number
// Problem: https://leetcode.com/problems/happy-number/
// SwiftLeetCode
//

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var copyN = n // copy input n
        var nSet: Set<Int> = [] // set to keep track of numbers already encountered.If the number is repeated, it means that a cycle has started and we will not get 1.
        
        var sum = 0 // final sum
        
        if copyN == 1 { return true} // If the number is immediately equal to 1, it is lucky.
        
        // Before the number becomes 1, we do:
        while copyN != 1 {
            
            // Check: if there was already such a number - loop, return false.
            if nSet.contains(copyN) { return false }
            
            // Otherwise, we save the number in Set.
            nSet.insert(copyN)
            
            // Calculate the sum of the squares of its digits, update copyN.
            copyN = sumOfSquares(copyN)
        }
        
        return true
    }
    
    // Auxiliary function: this function returns the sum of the squares of the digits of a number n.
    func sumOfSquares(_ n: Int) -> Int {
        var sum = 0
        var copyN = n
        
        while copyN != 0 {
            let result = copyN % 10 // take the last number
            sum += result * result // square this number and add to sum
            copyN /= 10 // delete the last number
        }
        return sum
    }
}
