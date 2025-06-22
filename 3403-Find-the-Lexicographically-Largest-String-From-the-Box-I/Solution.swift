//
// 3403. Find the Lexicographically Largest String From the Box I
// Problem: https://leetcode.com/problems/find-the-lexicographically-largest-string-from-the-box-i/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func answerString(_ word: String, _ numFriends: Int) -> String {
        // Handle the base case where there's only one friend.
        if numFriends == 1 {
            return word
        }

        let n = word.count // Get the length of the word.
        var res = "" // Initialize the result string.

        // Iterate through the word to find the lexicographically largest substring.
        for i in 0..<n {
            let startIndex = word.index(word.startIndex, offsetBy: i) // Get the starting index for the substring.
            let endIndex = word.index(startIndex, offsetBy: min(n - numFriends + 1, n - i)) // Get the ending index, ensuring the substring has length numFriends.
            let sub = String(word[startIndex..<endIndex]) // Extract the substring.

            // Update the result if the current substring is lexicographically larger.
            if sub > res {
                res = sub
            }
        }
        return res // Return the lexicographically largest substring.
    }
}

/*
Explanation in Simple Terms:

The Swift code iterates through the input string `word`, extracting substrings of length `numFriends`. It keeps track of the lexicographically largest substring encountered so far and returns it at the end. The `min` function ensures that the substring length doesn't exceed the remaining length of the word. The code efficiently finds the largest substring without needing to sort all substrings.
*/
