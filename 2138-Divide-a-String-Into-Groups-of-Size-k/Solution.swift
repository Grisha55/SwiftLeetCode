//
// 2138. Divide a String Into Groups of Size k
// Problem:
// SwiftLeetCode
//

import Foundation

class Solution {
    func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
        // Convert the string to an array of characters for easier processing.
        let chars = Array(s)
        let n = chars.count // Get the length of the string
        var result: [String] = [] // Initialize an empty array to store the groups

        // Iterate through the string in steps of k
        for i in stride(from: 0, to: n, by: k) {
            // Calculate the end index for the current group.
            let endIndex = min(i + k, n) // Handle cases where the last group is smaller than k

            // Create a substring representing the current group
            var group = String(chars[i..<endIndex])

            // If it's the last group and its length is less than k, add padding
            if endIndex < i + k {
                group += String(repeating: fill, count: i + k - endIndex)
            }

            // Add the group to the result array
            result.append(group)
        }

        // Return the array of groups
        return result
    }
}

/*
Explanation in Simple Terms:

The function iterates through the input string `s` in chunks of size `k`. For each chunk:

1. It creates a substring representing that chunk.
2. If it's the last chunk and its length is less than `k`, it pads the substring with the `fill` character until it reaches length `k`.
3. It adds the (possibly padded) chunk to the result array.

Finally, it returns the array of chunks (groups). The use of `stride(from:to:by:)` makes the iteration efficient and clear, handling both complete and incomplete groups gracefully. The `min` function ensures correct handling of the last group's length.
*/
