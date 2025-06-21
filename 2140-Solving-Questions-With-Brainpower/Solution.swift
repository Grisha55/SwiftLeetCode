//
// 2140. Solving Questions With Brainpower
// Problem: https://leetcode.com/problems/solving-questions-with-brainpower/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func mostPoints(_ questions: [[Int]]) -> Int {
        let n = questions.count // Get the total number of questions.
        var dp = Array(repeating: 0, count: n + 1) // Create a DP array. dp[i] stores the maximum points achievable starting from question i.

        // Iterate through the questions in reverse order.
        for i in stride(from: n - 1, through: 0, by: -1) {
            let points = questions[i][0] // Points for the current question.
            let skip = questions[i][1] // Number of questions to skip after answering the current question.
            let next = i + skip + 1 // Index of the next question that can be answered after answering the current one.

            // Calculate the points if we solve the current question.
            let solve = points + (next < n ? dp[next] : 0) //If next is within bounds, add the maximum points from next question, otherwise add 0.

            // Calculate the points if we skip the current question.
            // We take the maximum points achievable from the next question.
            dp[i] = max(solve, dp[i + 1]) // Take the maximum of solving and skipping the current question.
        }

        return dp[0] // Return the maximum points achievable starting from the first question.
    }

}

/*
Explanation in simple words:

The function uses dynamic programming. `dp[i]` stores the maximum number of points that can be obtained starting from the `i`-th question. The loop iterates through the questions in reverse order. For each question, the function considers two options:

1. Solve the question: Get the points for this question (`points`) plus the maximum number of points that can be obtained starting from the next available question (`dp[next]`). Note the `next < n` check to avoid going beyond the array bounds.

2. Skip the question: Just take the maximum number of points that can be obtained starting from the next question (`dp[i + 1]`).

The function chooses the maximum of these two values ​​and stores it in `dp[i]`. At the end, `dp[0]` contains the maximum number of points that can be obtained starting from the first question.

The algorithm has linear time complexity O(n), where n is the number of questions, and linear space complexity O(n) for the array `dp`.
*/
