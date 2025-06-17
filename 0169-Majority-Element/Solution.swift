//
// 0169. Majority Element
// Problme: https://leetcode.com/problems/majority-element/
// SwiftLeetCode
//

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var result = nums[0] // first potential majority element
        var count = 1 // A counter keeping track of the number of occurrences of the current `result`.

        // This algorithm is called the Boyer-Moore algorithm.

        for i in 1..<nums.count {

            // Compare with current `result`:
            if result == nums[i] {
                count += 1
            } else {

                // The counter is decreasing, which means we have encountered an element that is different from our potential dominant element.
                count -= 1

                // If the counter becomes 0, then the number of occurrences of `result` and other elements is equal.
                if count == 0 {
                    result = nums[i] // The current element `nums[i]` becomes the new potential dominant element.
                    count = 1 // The counter is reset to 1.
                }
            }
        }
        // After traversing the entire array, `result` contains the most frequently occurring element.
        return result
    }

/*
        Why does it work?

        The algorithm is based on the idea that if there is a dominant element, then its count exceeds the count of all other   elements combined. When decreasing the counter `count`, we discard elements that are not dominant. If the counter reaches zero, we change the potential dominant element and start counting again. At the end, `result` will contain the element that "won" this frequency competition. It is guaranteed that such an element exists, according to the problem statement.

Important: This algorithm works correctly only if the existence of a dominant element (an element that occurs more than `n/2` times, where `n` is the length of the array) is guaranteed.
*/
}
