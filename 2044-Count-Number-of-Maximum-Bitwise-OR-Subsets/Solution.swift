//
// 2044. Count Number of Maximum Bitwise-OR Subsets
// SwiftLeetCode
//

class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        let maxOR = nums.reduce(0, |)
        var count = 0
        let n = nums.count

        // Iterate through all possible non-empty subsets (1 to 2^n - 1)
        for mask in 1..<(1 << n) {
            var currentOR = 0

            // Check each bit in the mask to build the subset
            for i in 0..<n {
                // If i-th bit is set, include nums[i] in subset
                if mask & (1 << i) != 0 {
                    currentOR |= nums[i]
                }
            }

            // Count if this subset produces maximum OR
            if currentOR == maxOR {
                count += 1
            }
        }
        return count
    }
}

/*
Key Comments Explained:
    1. Maximum OR Calculation:
        - reduce(0, |) computes the cumulative OR of all elements
    2. Bitmask Approach:
        - Explains how each bit in the mask represents element inclusion
        - Documents the subset generation process
        - Shows the counting logic for valid subsets
    3. Complexity Notes:
        - Implicit in the comments is the O(2^n) complexity from generating all subsets
*/
