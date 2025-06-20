//
// 0567. Permutation in String
// Problem: https://leetcode.com/problems/permutation-in-string/
// SwiftLeetCode
//

import Foundation

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // Convert the strings to arrays of characters for easier manipulation.
        var s1Arr = Array(s1)
        var s2Arr = Array(s2)

        // Create a frequency map (dictionary) for characters in s1.
        // This stores the count of each character in s1.
        var seen: [Character: Int] = [:]
        for c in s1Arr {
            seen[c, default: 0] += 1 //Increment count, or add with count 1 if not present
        }

        // Initialize a frequency map for the sliding window in s2.
        var window: [Character: Int] = [:]
        // Set the length of the sliding window to match the length of s1.
        let windowLength = s1Arr.count

        // Iterate through s2 using a sliding window.
        for i in 0..<s2Arr.count {
            let char = s2Arr[i] //Get current character

            // Add the current character to the sliding window's frequency map.
            window[char, default: 0] += 1

            // If the window has reached its full length...
            if i >= windowLength {
                // Remove the leftmost character from the window.
                let leftChar = s2Arr[i - windowLength]
                window[leftChar]! -= 1 //Decrement count

                // If the count of the leftmost character becomes 0, remove it from the map.
                if window[leftChar]! == 0 {
                    window.removeValue(forKey: leftChar)
                }
            }

            // Check if the frequency map of the window matches the frequency map of s1.
            //If they match, it means s1 is a permutation of the current window.
            if window == seen {
                return true //Return true if match is found
            }
        }

        // If no permutation is found after checking all windows, return false.
        return false
    }
}

/*
Explanation in Simple Terms:

The function creates a frequency counter for `s1` (how many times each character appears). Then, it uses a sliding window of the same size as `s1` to move across `s2`. For each window position, it creates a frequency counter for that window. If the window's frequency counter exactly matches `s1`'s frequency counter, it means `s1` is a permutation of that substring, and the function returns `true`. If it goes through all possible windows without finding a match, it returns `false`.

This avoids checking every possible substring separately, making it significantly more efficient than a brute-force approach. The time complexity is O(n), where n is the length of `s2`, because it iterates through `s2` only once. The space complexity is O(1) because the frequency maps are bounded by the size of the alphabet.
*/
