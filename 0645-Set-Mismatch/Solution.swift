//
// 0645. Set Mismatch
// Problem: https://leetcode.com/problems/set-mismatch/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        // Create a mutable copy of the input array to modify it in place.
        var nums = nums
        // Initialize variables to store the duplicate and missing numbers.
        var duplicate = -1
        var missing = -1

        // Iterate through the array.
        for i in 0..<nums.count {
            // Calculate the index where the current number should be stored in the array (using its value as an index).
            let currentIndex = abs(nums[i]) - 1

            // If the number at currentIndex is negative, it means we've already seen this number.
            if nums[currentIndex] < 0 {
                //Therefore, it's a duplicate.
                duplicate = abs(nums[i]) //Store the absolute value as it might be negative
            } else {
                // Otherwise, mark the number as seen by negating it.
                nums[currentIndex] = -nums[currentIndex]
            }
        }

        // Iterate through the array again to find the missing number.
        for i in 0..<nums.count {
            // A positive number at index i indicates that i+1 is missing.
            if nums[i] > 0 {
                missing = i + 1
            }
        }

        // Return the duplicate and missing numbers as an array.
        return [duplicate, missing]
    }
}

/*
Explanation in Simple Terms:

The function uses the input array `nums` itself as a kind of hash table. It iterates through the array. For each number, it calculates its intended index (by subtracting 1 because arrays are 0-indexed).

* If the number at that index is already negative, it means the current number is a duplicate because we've already "marked" its correct position as seen by making it negative in a previous iteration.

* If the number at that index is positive, it negates the number at that index, effectively "marking" it as seen.

After the first loop, it iterates again. Any positive number remaining in `nums` indicates a missing number because its intended index was never visited (meaning that number was never present in the input).

This approach is very efficient because it only iterates through the array twice. The time complexity is O(n), and the space complexity is O(1) because it modifies the input array in place. No extra space proportional to the input size is used.
*/
