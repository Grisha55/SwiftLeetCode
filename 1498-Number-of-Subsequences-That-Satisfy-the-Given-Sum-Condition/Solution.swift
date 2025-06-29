//
// 1498. Number of Subsequences That Satisfy the Given Sum Condition
// SwiftLeetCode
//

import Foundation

class Solution {
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        let MOD = 1_000_000_007                    // Modulo value to prevent integer overflow
        let nums = nums.sorted()                   // Sort the input array to apply two-pointer technique
        let n = nums.count

        // Precompute powers of 2 up to n: pow2[i] = 2^i % MOD
        var pow2 = [Int](repeating: 1, count: n)
        for i in 1..<n {
            pow2[i] = (pow2[i - 1] * 2) % MOD
        }

        var result = 0
        var left = 0
        var right = n - 1

        // Two-pointer approach
        while left <= right {
            if nums[left] + nums[right] <= target {
                // All subsequences starting with nums[left] and ending at nums[right]
                // can be formed by including/excluding elements in between
                result = (result + pow2[right - left]) % MOD
                left += 1
            } else {
                // Decrease right to reduce the sum
                right -= 1
            }
        }

        return result
    }
}

/*
 Solution Explanation
 - Sort the array to apply the two-pointer technique.
- Fix the left pointer as the minimum element of a subsequence.
- Move the right pointer to find the largest possible maximum such that min + max <= target.
- For every such pair (left, right), the number of valid subsequences is 2^(right - left).
- Use precomputed powers of 2 to speed up the calculation and apply modulo to prevent overflow.
 */
