//
// 0287. Find the Duplicate Number
// Problem: https://leetcode.com/problems/find-the-duplicate-number/
// SwiftLeetCode
//

import Foundation

/*
💡 Algorithm idea:
This code uses Floyd's Tortoise and Hare algorithm, which is commonly used to find a cycle in a linked list. Here, the array is treated as a linked list:
    - Each index points to the next element at nums[i].

If there is a duplicate, then there will be a cycle in this "list" - because two different indices will point to the same value.

🔗 Steps:
Finding the meeting point:
    - slow moves 1 step,
    - fast moves 2 steps.
    - They will meet inside the cycle.

Finding the entry to the cycle:
    - One pointer returns to the beginning.
    - Both move 1 step.
    - They will meet at the beginning of the cycle, i.e. in the duplicate.
*/

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {

        // Initialize two pointers (slow and fast) to the first element
        var slow = nums[0]
        var fast = nums[0]

        // First phase: find the intersection point in the cycle
        repeat {
            slow = nums[slow]           // Move slow by one step
            fast = nums[nums[fast]]     // Move fast by two steps
        } while slow != fast            // Loop until they meet

        // Second phase: find the entrance to the cycle (duplicate number)
        fast = nums[0]
        while slow != fast {            // Reset fast to the start
            slow = nums[slow]           // Move slow by one step
            fast = nums[fast]           // Move fast by one step
        }

        // Return the duplicate number (entrance of the cycle)
        return slow
    }
}
