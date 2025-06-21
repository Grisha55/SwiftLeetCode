//
// 2929. Distribute Candies Among Children II
// Problem: https://leetcode.com/problems/distribute-candies-among-children-ii/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func distributeCandies(_ n: Int, _ limit: Int) -> Int {
        // Helper function to calculate combinations (n choose k).
        func comb(_ n: Int, _ k: Int) -> Int {
            // Handle invalid inputs.
            if n < k || k < 0 { return 0 }
            var result = 1
            // Calculate n! / (k! * (n-k)!) iteratively to avoid overflow.
            for i in 0..<k {
                result *= (n - i)
                result /= (i + 1)
            }
            return result
        }

        // Total number of ways to distribute candies without any limits. This is equivalent to stars and bars problem.
        var total = comb(n + 2, 2)

        // Subtract the cases where at least one child has more than limit candies.
        // We do this for each child (3 children).
        for i in 0..<3 {
            let over = n - (limit + 1) // Candies remaining after one child receives limit + 1 candies.
            total -= comb(over + 2, 2) // Subtract the combinations for the remaining candies among the 2 remaining children.
        }

        // Add back the cases where at least two children have more than limit candies (double counting correction).
        // We do this for each pair of children (3 choose 2 = 3 pairs).
        for i in 0..<3 {
            let over = n - 2 * (limit + 1) // Candies remaining after two children receive limit + 1 candies each.
            total += comb(over + 2, 2) // Add back the combinations for the remaining candies among the 1 remaining child.
        }

        // Subtract the cases where all three children have more than limit candies (triple counting correction).
        let over = n - 3 * (limit + 1) // Candies remaining after all three children receive limit + 1 candies each.
        total -= comb(over + 2, 2) // Subtract the combinations for the remaining candies among the 0 remaining children. This would always be 0 but for consistency we are keeping this line.

        return total
    }
}

/*
Explanation in Simple Terms:

The problem is solved using the Principle of Inclusion-Exclusion.

1. Total Combinations: First, it calculates the total number of ways to distribute `n` candies among 3 children without any restrictions using combinations (stars and bars).

2. Subtracting Over-Limit Cases: It subtracts the cases where at least one child receives more than `limit` candies. This involves calculating how many ways to distribute the remaining candies among the other two children.

3. Adding Back Over-counted Cases: Because step 2 subtracts cases where *multiple* children have more than `limit` candies multiple times, those cases must be added back in. This is done for pairs of children who each receive more than `limit` candies.

4. Subtracting Over-counted Cases Again: Similarly, cases where *all three* children have more than `limit` candies have been added back multiple times in the previous step (they were subtracted three times and added back three times), so they need to be subtracted once more.

This inclusion-exclusion process ensures that each valid distribution of candies (where no child exceeds `limit`) is counted exactly once. The `comb` function calculates combinations efficiently. The time complexity is dominated by calculating combinations, which is relatively fast. The space complexity is O(1).
*/
