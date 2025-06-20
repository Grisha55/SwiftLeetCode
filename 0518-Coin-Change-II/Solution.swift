//
// 0518. Coin Change II
// Problem: https://leetcode.com/problems/coin-change-ii/
// SwiftLeetCode
//

import Foundation

class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        // Initialize an empty dictionary to store the results of subproblems (memoization).
        var dp: [[Int]: Int] = [:]
        // Call the recursive helper function to solve the problem.
        let res = helper(index: coins.count - 1, target: amount, arr: coins, dp: &dp)
        return res
    }

    func helper(index: Int, target: Int, arr: [Int], dp: inout [[Int]: Int]) -> Int {
        // Base case: If we're at the last coin, check if we can make the target amount using only that coin.
        if index == 0 {
            // If the target is divisible by the last coin, it means we can make the target amount.
            if target % arr[index] == 0 {
                return 1 // One way to make the target using only the last coin.
            } else {
                return 0 // No way to make the target using only the last coin.
            }
        }

        // Check if the result for this subproblem is already stored in the dp dictionary.
        if let result = dp[[index, target]] {
            return result // Return the stored result.
        }

        // Recursive calls:
        // 1. Not taking the current coin: Recursively solve the problem without using the current coin.
        let nottake = helper(index: index - 1, target: target, arr: arr, dp: &dp)
        // 2. Taking the current coin (if possible): Recursively solve the problem after subtracting the current coin's value from the target.
        var take = 0
        if arr[index] <= target {
            take = helper(index: index, target: target - arr[index], arr: arr, dp: &dp)
        }

        // Store the result of this subproblem in the dp dictionary.
        dp[[index, target]] = take + nottake
        // Return the total number of ways to make the target amount.
        return dp[[index, target]]!
    }
}

/*
 Explanation in Simple Terms:

 The `change` function uses a recursive helper function (`helper`) to count the ways to make the target amount using the available coins. The `helper` function uses memoization (storing results in `dp`) to avoid redundant calculations.

 The `helper` function explores two possibilities at each step:

 1. Not taking the current coin: It recursively calls itself with the next smaller coin (`index - 1`) and the same target amount.

 2. Taking the current coin: If the current coin's value is less than or equal to the target amount, it recursively calls itself with the same coin (`index`) but reduces the target amount by the coin's value.

 The base case is when there's only one coin left (`index == 0`). In this case, it checks if the target amount is a multiple of that coin. If it is, there's one way; otherwise, there are zero ways.

 Memoization (using `dp`) stores the results of each subproblem to avoid recalculating them. This significantly improves the efficiency of the algorithm. The result is the sum of ways to make the target amount by either taking or not taking the current coin.


 This approach is a top-down dynamic programming solution, efficiently solving the coin change problem. The memoization prevents exponential time complexity, making it much faster than a purely recursive approach without memoization.
 */
