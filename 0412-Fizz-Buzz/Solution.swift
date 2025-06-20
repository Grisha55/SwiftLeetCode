//
// 0412. Fizz Buzz
// Problem: https://leetcode.com/problems/fizz-buzz/
// SwiftLeetCode
//

import Foundation

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        // Result array
        var result: [String] = []

        // Cycle from 1 to a given number (included)
        for i in 1...n {
            // answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
            if i % 15 == 0 {
                result.append("FizzBuzz")
            // answer[i] == "Fizz" if i is divisible by 3.
            } else if i % 3 == 0 {
                result.append("Fizz")
            // answer[i] == "Buzz" if i is divisible by 5.
            } else if i % 5 == 0 {
                result.append("Buzz")
            // answer[i] == i (as a string) if none of the above conditions are true
            } else {
                result.append(String(i))
            }
        }

        // Return final result array
        return result
    }
}
