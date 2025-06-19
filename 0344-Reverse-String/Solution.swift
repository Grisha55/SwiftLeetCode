//
// 0344. Reverse String
// Problem: https://leetcode.com/problems/reverse-string/
// SwiftLeetCode
//

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {

        // Initialize two pointers: 'left' points to the beginning of the array, and 'right' points to the end.
        var left = 0
        var right = s.count - 1

        // Iterate while the 'left' pointer is less than the 'right' pointer.
        while left < right {

            // Swap the characters at the 'left' and 'right' indices.
            s.swapAt(left, right)

            // Move the 'left' pointer one position to the right.
            left += 1
            // Move the 'right' pointer one position to the left.
            right -= 1
        }
    }
}

/*
Explanation in simple terms:

The function uses two pointers, `left` and `right`, to point to the beginning and end of the character array, respectively. It iteratively swaps the characters at these two pointer positions, then moves the pointers towards the middle. The loop continues until the `left` and `right` pointers cross each other (meaning the entire string has been reversed).

Example:

Let's say `s = ['h', 'e', 'l', 'l', 'o']`.

1. `left = 0`, `right = 4`. `s.swapAt(0, 4)` swaps 'h' and 'o', resulting in `s = ['o', 'e', 'l', 'l', 'h']`.
2. `left = 1`, `right = 3`. `s.swapAt(1, 3)` swaps 'e' and 'l', resulting in `s = ['o', 'l', 'l', 'e', 'h']`.
3. `left = 2`, `right = 2`. The loop condition `left < right` is false, so the loop terminates.

The function modifies the original array `s` in place, so it now contains the reversed string `['o', 'l', 'l', 'e', 'h']`. This is an efficient in-place reversal algorithm with a time complexity of O(n), where n is the length of the string, and a space complexity of O(1) because it doesn't use any extra space proportional to the input size.
*/
