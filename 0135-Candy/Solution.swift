//
// 0135. Candy
// Problem: https://leetcode.com/problems/candy/
// SwiftLeetCode
//

import Foundation

class Solution {

    /*
        Algorithm idea
        We pass the array twice:
            1. From left to right - to handle cases where the rating increases on the right.
            2. From right to left - to process cases when the rating increases on the left.
    */

    func candy(_ ratings: [Int]) -> Int {
        var n = ratings.count

        // Give each child one candy (the least amount possible).
        var candies = Array(repeating: 1, count: n)

        for i in 1..<n {

            // If the child on the right (i) has a higher rating than the child on the left (i - 1),
            // he/she gets 1 more candy than the child on the left.
            if ratings[i] > ratings[i - 1 ] {
                candies[i] = candies[i - 1] + 1
            }
        }

        for i in stride(from: n - 2, through: 0, by: -1) {

            // If the rating of the child on the left is higher than that of the neighbor on the right,
            // we do the same thing: we give 1 more than the one on the right.
            if ratings[i] > ratings[i + 1] {

                // We use max because the child may have already gotten more in the previous step (so as not to make it worse).
                candies[i] = max(candies[i], candies[i + 1] + 1)
            }
        }

        return candies.reduce(0, +)
    }
}
