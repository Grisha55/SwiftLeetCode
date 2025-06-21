//
// 0852. Peak Index in a Mountain Array
// Problem: https://leetcode.com/problems/peak-index-in-a-mountain-array/
// SwiftLeetCode
//

import Foundation

class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var left = 0               // Left pointer at the beginning of the array
        var right = arr.count - 1  // Right pointer at the end of the array

        // Keep searching until the search space is reduced to two elements
        while left + 1 != right {
            let mid = (left + right) / 2 // Middle index

            // If the middle is greater than the next element, we are on the descending part
            if arr[mid] > arr[mid + 1] {
                right = mid // Move right to mid (possible peak)
            } else {
                left = mid  // Otherwise, move left to mid (peak is to the right)
            }
        }
        
        return right // Return the peak index (guaranteed by mountain array properties)
    }
}

/*
🏔️ Problem statement:
A "mountain range" is an array of numbers that first strictly increases and then strictly decreases.
For example: [1, 3, 5, 7, 6, 4, 2]

You need to find the index of the peak - that is, the element that is strictly greater than its neighbors (in this case, 7 at position 3).


🔍 Simple explanation:
Instead of linear search (O(n)) we use binary search (O(log n)):

Look at the middle of the array.

If the middle is less than the next one, then we are on an ascending slope, the peak is on the right.

If the middle is greater than the next one, then we are on a descending slope, the peak is on the left or in the middle.

Repeat until there are two elements left, one of which is the peak.


✅ Example of work:
For the array [0, 2, 4, 7, 5, 3, 1]:

First: mid = 3, arr[3] = 7, arr[4] = 5 → decreases → move right = mid

Next: left = 2, right = 3 remain

The condition left + 1 == right is satisfied → return right = 3

📊 Complexity:
Time: O(log n) — thanks to binary search

Memory: O(1) — without using additional memory
*/
