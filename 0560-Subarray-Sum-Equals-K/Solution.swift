//
// 0560. Subarray Sum Equals K
// Problem: https://leetcode.com/problems/subarray-sum-equals-k/
// SwiftLeetCode
//

import Foundation

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        // Initialize a dictionary to store the frequency of cumulative sums.
        // We start with a count of 1 for a sum of 0 because an empty subarray has a sum of 0.
        var subarrayCounts: [Int: Int] = [0: 1]
        // Initialize the current running sum to 0.
        var currentSum = 0
        // Initialize the count of subarrays with sum k to 0.
        var count = 0

        // Iterate through each number in the input array.
        for num in nums {
            // Add the current number to the running sum.
            currentSum += num

            // Check if there's a previous cumulative sum that, when added to k, equals the current sum.
            // If so, it means we've found a subarray with sum k. The frequency tells us how many such subarrays exist.
            if let freq = subarrayCounts[currentSum - k] {
                count += freq // Add the frequency to the total count.
            }

            // Update the frequency of the current cumulative sum.
            // If the sum already exists, increment its count; otherwise, add it to the dictionary with a count of 1.
            subarrayCounts[currentSum, default: 0] += 1
        }

        // Return the total count of subarrays with sum k.
        return count
    }
}

/*
Explanation in Simple Terms:

The function works by maintaining a running sum (`currentSum`). For each number, it checks if there's a previous running sum (`currentSum - k`) that, when added to `k`, would result in the current sum. If such a previous sum exists, it implies a subarray with sum `k` has been found. The frequency of that previous sum indicates the number of such subarrays starting at different points.

The `subarrayCounts` dictionary keeps track of how many times each cumulative sum appears. The `default: 0` in `subarrayCounts[currentSum, default: 0] += 1` ensures that if a sum is encountered for the first time, it's added to the dictionary with a count of 1; otherwise, its count is incremented.

Example:

Let's say `nums = [1, 1, 1]` and `k = 2`.

1. Initially, `currentSum = 0`, `subarrayCounts = [0: 1]`.
2. `num = 1`: `currentSum = 1`. `subarrayCounts[1 - 2]` doesn't exist, so nothing happens. `subarrayCounts` becomes `[0: 1, 1: 1]`.
3. `num = 1`: `currentSum = 2`. `subarrayCounts[2 - 2] = subarrayCounts[0] = 1`, so `count` becomes 1. `subarrayCounts` becomes `[0: 1, 1: 1, 2: 1]`.
4. `num = 1`: `currentSum = 3`. `subarrayCounts[3 - 2] = subarrayCounts[1] = 1`, so `count` becomes 2. `subarrayCounts` becomes `[0: 1, 1: 1, 2: 1, 3: 1]`.
5. The function returns `count = 2`.

This algorithm has a time complexity of O(n) because it iterates through the array once. The space complexity is also O(n) in the worst case, as the `subarrayCounts` dictionary could potentially store all cumulative sums. It's a very efficient approach compared to brute-force methods.
*/
