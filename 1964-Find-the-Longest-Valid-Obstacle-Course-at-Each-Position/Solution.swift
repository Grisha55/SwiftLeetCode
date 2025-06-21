//
// 1964. Find the Longest Valid Obstacle Course at Each Position
// Problem: https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
        var result = [Int]() // Result array to store the length of the longest non-decreasing subsequence at each position.
        var stack = [Int]() // Stack to store the smallest possible "tails" of non-decreasing subsequences.

        for obstacle in obstacles {
            var left = 0       // Left boundary for binary search.
            var right = stack.count // Right boundary for binary search.

            // Binary search to find the rightmost position in the stack where obstacle can be inserted while maintaining non-decreasing order.
            while left < right {
                let mid = (left + right) / 2
                if stack[mid] <= obstacle { // If the element at mid is less than or equal to the current obstacle, it means we can potentially insert the obstacle further to the right.
                    left = mid + 1         // Move the left boundary to the right.
                } else {
                    right = mid             // Otherwise, move the right boundary to the left.
                }
            }

            // `left` now represents the length of the longest non-decreasing subsequence ending with an element less than or equal to `obstacle`.
            result.append(left + 1) // Add 1 because we are adding the current obstacle to the subsequence.

            // Update the stack: either append the obstacle to the end or replace an element.
            if left == stack.count { // If `left` is equal to the size of the stack, it means we need to append the obstacle to extend the longest subsequence.
                stack.append(obstacle) // Append the obstacle to the end of the stack.
            } else {
                stack[left] = obstacle // Otherwise, replace the element at index `left` with the current obstacle (to potentially create a better subsequence later).
            }
        }

        return result // Return the array containing the length of the longest non-decreasing subsequence at each position.
    }

}

/*
In plain English:

The function iterates over the `obstacles` array of obstacles. For each obstacle, it uses binary search on the `stack` to find the largest non-decreasing subsequence into which the current obstacle can be added. The `stack` stores only the "tails" of such subsequences - the smallest values ​​that can be the tails of non-decreasing subsequences of a given length. Binary search effectively determines the position where the current obstacle can be inserted, preserving non-decreasing order. The length of this subsequence (plus 1 for the added obstacle) is stored in `result`. The stack is then updated, either by adding the current obstacle to the end if it is larger than all elements, or by replacing the element at the found position if the current obstacle is smaller.

Then `result` contains the lengths of the largest non-decreasing subsequences for each position in the original array. This algorithm runs in O(n log n) time, where n is the length of the `obstacles` array, thanks to binary search.
*/
