//
// 0367. Valid Perfect Square
// Problem: https://leetcode.com/problems/valid-perfect-square/
// SwiftLeetCode
//

import Foundation

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {

        // If the number is 0 or 1, it's a perfect square by definition
        if num < 2 { return true }

        // Initialize the binary search range: from 2 to num / 2
        var left = 2
        var right = num / 2

        // Perform binary search
        while left <= right {

            // Get the middle value of the current range
            let mid = (left + right) / 2

            // Calculate the square of the middle value
            let sqr = mid * mid

            // If the square equals the number, it's a perfect square
            if sqr == num {
                return true
            // If the square is less than the number, search in the right half
            } else if sqr < num {
                left = mid + 1
            // If the square is more than the number, search in the left half
            } else {
                right = mid - 1
            }
        }

        // If we exit the loop, the number is not a perfect square
        return false
    }
}

/*
🧠 Simple explanation
The function checks whether a number is a perfect square — that is, the result of raising some integer to the square.

Examples:
    - 16 is 4 * 4, so yes, a perfect square.
    - 14 is not anyone's square, so no.

🔍 How it does it:
The function does not go through all the numbers in a row, but uses binary search (that is, it divides the range in half) to quickly find a number mid such that mid * mid == num.

📌 Why it works this way:
Binary search is efficient because it reduces the search range by 2 times at each step, rather than checking all numbers in a row.

Instead of sqrt(num) and converting to Int (which could lead to inaccuracy), here is an accurate and fast way - multiplication and comparison.
*/
