//
// 3085. Minimum Deletions to Make String K-Special
// Problem:
// SwiftLeetCode
//

import Foundation

class Solution {
    func minimumDeletions(_ word: String, _ k: Int) -> Int {
        var freq: [Character: Int] = [:]

        // Count frequency of each character
        for char in word {
            freq[char, default: 0] += 1
        }

        // Convert frequency values to an array
        let counts = freq.values.sorted()

        let maxFreq = counts.last ?? 0
        var minDeletions = Int.max

        // Try all possible base frequencies t from 1 to maxFreq
        for t in 1...maxFreq {
            var deletions = 0

            for count in counts {
                if count < t {
                    // If the count is less than t, we must delete the whole character group
                    deletions += count
                } else if count > t + k {
                    // If the count is greater than to + k, delete the excess
                    deletions += count - (t + k)
                }
                // If in [t, t + k], do nothing
            }

            minDeletions = min(minDeletions, deletions)
        }

        return minDeletions
    }
}

/*
📘 Problem statement — explanation in plain language:
You are given a string word and a number k.
k-special string is a string where the difference in frequencies of any two symbols does not exceed k.

For example, if k = 1, then the symbol 'a' can occur at most 1 more than 'b', 'c', etc.

👉 Your task is to remove the minimum number of symbols to make the string k-special.



🧠 Simple solution idea:
1. Let's count the frequencies of all symbols in the string.
2. We'll go through all possible target frequencies t from 1 to the maximum frequency:
    - We'll try to make sure that all symbols occur with frequencies from t to t + k.
    - If the symbol frequency is higher, we'll remove the extra one.
    - If it's less, we can ignore or completely remove the symbol.
3. Let's calculate how many symbols need to be removed so that all frequencies fit into [t, t + k].
4. Let's take the minimum among all possible options.
*/
