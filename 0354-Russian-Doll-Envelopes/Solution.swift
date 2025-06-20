//
// 0354. Russian Doll Envelopes
// Problem: https://leetcode.com/problems/russian-doll-envelopes/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {

        // Sort the envelopes:
        // - Ascending by width
        // - Descending by height when widths are equal
        let sortedEnvelopes = envelopes.sorted {
            if $0[0] == $1[0] {
                return $0[1] > $1[1] // Sort descending by height if widths are equal
            } else {
                return $0[0] < $1[0] // Otherwise, sort ascending by width
            }
        }

        // Extract only the heights from the sorted envelopes
        let heights = sortedEnvelopes.map { $0[1] }

        // This array will store the increasing subsequence
        var subsequence: [Int] = []

        // Go through each height
        for h in heights {
            var left = 0
            var right = subsequence.count

            // Binary search to find the correct position of current height in subsequence
            while left < right {
                let mid = (left + right) / 2
                if subsequence[mid] < h {
                    left = mid + 1 // Move right if current value is smaller
                } else {
                    right = mid // Move left if current value is larger or equal
                }
            }

            // If height is larger than all in subsequence, append it
            if left == subsequence.count {
                subsequence.append(h)
            } else {
                // Otherwise, replace the element to maintain a smaller possible value
                subsequence[left] = h
            }
        }

        // The length of the subsequence is the answer
        return subsequence.count
    }
}

/*
📦 What does the maxEnvelopes function do?
You have an array of envelopes, and each of them is a pair of numbers [width, height]. You need to find the maximum number of envelopes that can be nested inside each other, like Russian dolls. You can nest only if both the width and the height of the next envelope are strictly greater than the previous one.


🧠 How it works: a simple explanation
1. Sort all the envelopes:
    - First by width in ascending order.
    - If the width is the same, then by height in descending order (this is important to avoid nesting the same width).

2. From the resulting sorted list, take only the heights.
3. We use the algorithm for finding the longest increasing subsequence (LIS - Longest Increasing Subsequence), but we do this using binary search, which gives us good performance - O(n log n).
*/
