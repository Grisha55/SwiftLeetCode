//
// 3068. Find the Maximum Sum of Node Values
// Problem: https://leetcode.com/problems/find-the-maximum-sum-of-node-values/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maximumValueSum(_ nums: [Int], _ k: Int, _ edges: [[Int]]) -> Int {
        let n = nums.count // Get the number of elements in the input array.
        var baseSum = 0 // Initialize the sum without any XOR operations.
        var gains: [Int] = [] // Initialize an array to store the potential gains from XORing each number.

        // Calculate the base sum and the potential gain for each number.
        for num in nums {
            baseSum += num // Add the current number to the base sum.
            let flipped = num ^ k // Perform the bitwise XOR operation.
            let gain = flipped - num // Calculate the gain (difference between XORed value and original value).
            gains.append(gain) // Store the gain.
        }

        // Sort the gains in descending order.
        gains.sort(by: >)

        // Initialize variables for tracking the maximum sum, current sum, and number of operations.
        var maxSum = baseSum // Start with the base sum as the initial maximum.
        var currentSum = baseSum // Initialize the current sum to the base sum.
        var operations = 0 // Initialize the number of XOR operations performed.

        // Iteratively apply XOR operations to numbers with the largest gains.
        for gain in gains {
            currentSum += gain // Add the gain to the current sum.
            operations += 1 // Increment the operation counter.

            // Only update maxSum if an even number of operations have been performed. This is a greedy strategy to ensure that we choose only at most half of numbers to apply the XOR operation to
            if operations % 2 == 0 {
                maxSum = max(maxSum, currentSum) // Update the maximum sum if the current sum is greater.
            }
        }
        // Return the maximum sum found.
        return maxSum
    }
}

/*
Explanation in Simple Terms:

The algorithm works as follows:

1. Calculate Gains: For each number in `nums`, it calculates the difference between the number after applying XOR (`num ^ k`) and the original number. This difference represents the potential gain from applying the XOR operation.

2. Sort Gains: The gains are sorted in descending order. This prioritizes applying the XOR operation to numbers that yield the largest gains.

3. Greedy Iteration: The algorithm iteratively adds the gains to the current sum. It updates the maximum sum only after an even number of XOR operations. This ensures that we are applying XOR to at most half of the numbers in a way that aims to maximize the sum. This is a greedy strategy, and may not always find the absolute global maximum in all cases, but it's efficient and often provides a good approximation.

The time complexity is dominated by sorting, which is O(n log n), where n is the length of `nums`. The space complexity is O(n) to store the gains. The `edges` array is not used, suggesting this might be a simplified version of a more complex graph-related problem.
*/
