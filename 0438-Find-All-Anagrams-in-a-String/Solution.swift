//
// 0438. Find Add Anagrams in a String
// Problem: https://leetcode.com/problems/find-all-anagrams-in-a-string/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        // Convert input strings to character arrays for easier indexing
        var sArr = Array(s)
        var pArr = Array(p)

        // Store result indices
        var result: [Int] = []

        // Count the frequency of each character in string p
        var pCount: [Character: Int] = [:]
        for c in pArr {
            pCount[c, default: 0] += 1
        }

        // Dictionary to track character counts in the current window of string s
        var window: [Character: Int] = [:]
        // The size of the sliding window is equal to the length of p
        let windowSize = pArr.count

        // Iterate over each character in s
        for i in 0..<sArr.count {
            let c = sArr[i]
            // Add current character to the window count
            window[c, default: 0] += 1

            // If the window is larger than needed, remove the oldest character
            if i >= windowSize {
                let leftChar = sArr[i - windowSize]
                window[leftChar]! -= 1

                // If the count becomes zero, remove the character from dictionary
                if window[leftChar]! == 0 {
                    window.removeValue(forKey: leftChar)
                }
            }

            // Compare window frequency with the pCount frequency
            if window == pCount {
                // If match, store the starting index of the window
                result.append(i - windowSize + 1)
            }
        }

        // Return list of starting indices of anagrams
        return result
    }
}

/*
🧠 Simple explanation:
1. First we count how many times each letter appears in p.
2. Then we slide over the string s with a window of length p.count.
3. In each window we count the letters and compare them with what was in p.
4. If it matches, it's an anagram, we save the index of the beginning of the window.

📌 Things to remember:
    - Comparing two dictionaries (window == pCount) works because Swift compares key/value pairs.
    - This is an efficient algorithm because instead of recalculating each time, we update the window by adding/removing characters one at a time.
*/
