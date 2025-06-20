//
// 0377. Combination Sum IV
// Problem: https://leetcode.com/problems/combination-sum-iv/
// SwiftLeetCode
//

import Foundation

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        // Sort the array to make it easier to break early in loops
        let nums = nums.sorted()

        // Store the number of elements in nums
        let numsCount = nums.count

        // Variable to hold total combinations (not used directly here)
        var combinations = 0

        // Dictionary for memoization to store results for sub-targets
        var map: [Int: Int] = [:]

        // Recursive helper function to count combinations for a given target
        func count(target: Int) -> Int {

            // Base case: if target is 0, one valid combination is found
            if target == 0 { return 1 }

            // If result is already computed, return it from the memo map
            if let combos = map[target] { return combos }

            // Variable to count the current number of combinations
            var currentCombos = 0

            // Try every number in nums to build the combination
            for j in 0..<numsCount {
                let num = nums[j]

                // Stop if the current number exceeds the target
                if target < num { break }

                // Recursively count combinations with the remaining target
                currentCombos += count(target: target - num)
            }
            
            // Store the result in memoization map for future reuse
            map[target] = currentCombos

            // Return the number of combinations for the current target
            return currentCombos
        }

        // Start the recursion with the full target
        return count(target: target)
    }
}

/*
📌 How the function works:
    - Sort nums for convenience (if the number is greater than target, then we immediately stop iterating).
    - Create a cache (map dictionary) to remember the already calculated values ​​- this is memoization.
    - Recursively call the count(target:) function, decreasing target by each possible number from nums until target becomes 0.
    - If target == 0 - this means that the combination is suitable, and we return 1.
    - If we have already counted combinations for target - we simply return from the cache (speeds up execution).
    - At the end, we return the total number of combinations.
*/
