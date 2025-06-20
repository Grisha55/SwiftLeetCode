//
// 0646. Maximum Length of Pair Chain
// Problem: https://leetcode.com/problems/maximum-length-of-pair-chain/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        // Sort the pairs by their first element in ascending order. This is crucial for the dynamic programming approach.
        let sp = pairs.sorted { $0[0] < $1[0] }
        let n = sp.count //Get the total number of pairs

        // dp[i] stores the maximum length of a chain ending at the i-th pair. Initialize all to 1 (a single pair is a chain of length 1).
        var dp = Array(repeating: 1, count: n)

        // Iterate through each pair.
        for i in 0..<n {
            // Iterate through the pairs before the current pair.
            for j in 0..<i {
                // Check if the current pair can be added to the chain ending at pair j.
                //The condition checks if the second element of pair j is less than the first element of pair i. This ensures a valid chain.
                if sp[j][1] < sp[i][0] {
                    //If it can be added, update dp[i] to be the maximum of its current value and the length of the chain ending at j plus 1 (for adding the current pair).
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        // Find the maximum length among all chains. The longest chain's length is the maximum value in the dp array.
        return dp.max() ?? 0 //Return 0 if the array is empty.
    }
}

/*
Explanation in Simple Terms:

The function first sorts the pairs by their first element. Then, it uses dynamic programming. `dp[i]` represents the length of the longest chain that ends with the `i`-th pair. It iterates through the pairs. For each pair, it checks if it can be added to chains ending at earlier pairs (meaning the current pair's first element is greater than the previous pair's second element). If it can, it updates `dp[i]` to be the maximum chain length that includes the current pair. Finally, it returns the maximum value in the `dp` array, which represents the length of the longest chain.

Example:

Let's say `pairs = [[1,2],[2,3],[3,4]]`.

1. `sp` becomes `[[1,2],[2,3],[3,4]]` after sorting.
2. `dp` is initialized to `[1, 1, 1]`.
3. The outer loop iterates:
   - `i = 0`: The inner loop doesn't execute.
   - `i = 1`: `j = 0`. `sp[0][1] (2) < sp[1][0] (2)` is false, so `dp[1]` remains 1.
   - `i = 2`: `j = 0`. `sp[0][1] (2) < sp[2][0] (3)` is true, so `dp[2] = max(1, 1 + 1) = 2`. `j = 1`. `sp[1][1] (3) < sp[2][0] (3)` is false.
4. The maximum value in `dp` is 2, so the function returns 2.


This dynamic programming approach is efficient because it avoids redundant calculations. The time complexity is O(n^2) due to the nested loops, where n is the number of pairs. The space complexity is O(n) to store the `dp` array.
*/
