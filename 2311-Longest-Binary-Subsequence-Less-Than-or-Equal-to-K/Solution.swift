//
// 2311. Longest Binary Subsequence Less Than or Equal to K
// SwiftLeetCode
//

import Foundation

class Solution {
    func longestSubsequence(_ s: String, _ k: Int) -> Int {
        // Convert the input string to an array of characters for easy indexing
        let chars = Array(s.reversed()) // Reverse the string to process from least significant bit
        var sum = 0     // Total binary value of selected subsequence
        var count = 0   // Number of characters in valid subsequence


        let bits = String(k, radix: 2).count // Number of bits to represent k

        for (i, ch) in chars.enumerated() {
            if ch == "1" {
                // We can only include this '1' if its bit position is within limit
                // and it doesn't make the number exceed k
                if i < bits && sum + (1 << i) <= k {
                    sum += 1 << i
                    count += 1
                }
            } else {
                // '0' can always be added since it doesn't increase the value
                count += 1
            }
        }

        return count
    }
}

/*
📌 What's important:
    - A subsequence is any characters of a string left in the original order, but not necessarily in a row.
    - The string can start with zeros.
    - We need to find the maximum number of characters that can be included without exceeding the value of k.


🔍 Step-by-step explanation:
    1. s.reversed() - we go from the end of the string, i.e. from the low-order bits to the high-order bits (in binary, this is important).
        - For example: "1001010" → "0101001"

    2. bits = String(k, radix: 2).count:
        - Count how many bits at most a binary number ≤ k can contain.
        - Example: k = 5 → binary representation "101" → 3 bits.

    3. Go through each character of the string:

        - If ‘0’:
            - Add always: count += 1 - because it does not increment the value of sum.
        - If ‘1’:
            - We want to add the 2^i bit, but only if:
                - i < bits (otherwise we will add a bit that is too "expensive", which is exactly larger than k).
                - sum + (1 << i) <= k - if after adding the sum is not greater than k, we include it.

    4. Return count - this is the length of the largest subsequence whose value ≤ k.
*/
