//
// 0740. Delete and Earn
// Problem: https://leetcode.com/problems/delete-and-earn/
// SwiftLeetCode
//

import Foundation

class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 } // Handle empty input array

        let maxVal = nums.max()! // Find the maximum value in the input array. This determines the size of our DP array.
        var points = [Int](repeating: 0, count: maxVal + 1) // Create an array to store the total points for each number.

        //Sum up the points for each number. The index represents the number, and the value is the total points earned from that number.
        for num in nums {
            points[num] += num
        }

        // Handle base cases:
        if maxVal == 0 {
            return points[0] //If maxVal is 0, we only have the number 0 in the input.
        } else if maxVal == 1 {
            return max(points[0], points[1]) //If maxVal is 1, we can choose to take points[0] or points[1] but not both.
        }

        // Dynamic programming array: dp[i] stores the maximum points achievable considering numbers up to i.
        var dp = [Int](repeating: 0, count: maxVal + 1)
        dp[0] = points[0] //Base cases for the dp array.
        dp[1] = max(points[0], points[1]) //Base cases for the dp array.

        //Iterate and build the dp array.
        for i in 2...maxVal {
            //The maximum points achievable using number 'i' are either:
            // 1. The maximum points achievable without using 'i' (dp[i-1])
            // 2. The maximum points achievable using 'i' and not using 'i-1' (dp[i-2] + points[i])
            dp[i] = max(dp[i - 1], dp[i - 2] + points[i])
        }

        //The maximum points possible are stored at the end of the dp array.
        return dp[maxVal]
    }

}

/*
Explanation in Simple Terms:

The function first creates an array `points` where `points[i]` stores the total value of all occurrences of the number `i` in the input `nums`. Then, it uses dynamic programming. The `dp` array stores the maximum points achievable up to a certain number. `dp[i]` represents the maximum points achievable considering numbers up to `i`. To calculate `dp[i]`, we choose the maximum between:

1. Not using `i`: `dp[i-1]` (the maximum points achievable without using `i`).
2. Using `i`: `dp[i-2] + points[i]` (the maximum points achievable using `i` but not `i-1`, since consecutive numbers are forbidden).

The final answer is `dp[maxVal]`, representing the maximum points achievable using all numbers up to the maximum value in the input array. The algorithm cleverly avoids checking all possible combinations by using dynamic programming, resulting in a much more efficient solution. The time complexity is O(n + maxVal), and the space complexity is O(maxVal).
*/
