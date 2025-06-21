//
// 2560. House Robber IV
// Problem: https://leetcode.com/problems/house-robber-iv/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func minCapability(_ nums: [Int], _ k: Int) -> Int {
        // Handle empty and single-element cases.
        if nums.isEmpty { return 0 } // If no houses, no capability needed.
        if nums.count == 1 { return nums[0] } // If only one house, its capability is the minimum.

        // Initialize the search space.
        var left = nums.min()! // Minimum capability in the array.
        var right = nums.max()! // Maximum capability in the array.

        // Helper function to check if we can rob at least k houses with a given capability.
        func canRob(_ cap: Int) -> Bool {
            var i = 0 // Index to iterate through the houses.
            var count = 0 // Number of houses robbed.

            // Iterate through the houses.
            while i < nums.count {
                // If the current house's capability is less than or equal to the given capability...
                if nums[i] <= cap {
                    // ...rob the house, increment the count, and skip the next house (because we can't rob adjacent houses).
                    count += 1
                    i += 2
                } else {
                    // Otherwise, skip the current house.
                    i += 1
                }
            }

            // Return true if we robbed at least k houses.
            return count >= k
        }

        // Perform binary search to find the minimum capability.
        while left < right {
            let mid = (left + right) / 2 // Calculate the middle capability.
            //If we can rob at least k houses with the middle capability, try a smaller capability.
            if canRob(mid) {
                right = mid //Try a smaller capability.
            } else {
                left = mid + 1 //Otherwise, try a larger capability.
            }
        }

        // Left is the minimum capability that allows robbing at least k houses.
        return left
    }
}

/*
Explanation in Simple Terms:

The algorithm uses binary search to find the minimum capability. The `canRob` function checks if, given a certain capability, we can rob at least `k` houses. The binary search iteratively narrows down the search space until it finds the smallest capability that allows us to rob at least `k` houses. The `canRob` function simulates the robbery, skipping adjacent houses. The time complexity is O(N log M), where N is the number of houses and M is the range of capabilities (max - min). The space complexity is O(1).
*/
