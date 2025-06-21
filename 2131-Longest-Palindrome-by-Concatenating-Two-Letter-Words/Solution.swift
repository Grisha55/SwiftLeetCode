//
// 2131. Longest Palindrome by Concatenating Two Letter Words
// Problem: https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/description/
// SwiftLeetCode
//

import Foundation

class Solution {

    func longestPalindrome(_ words: [String]) -> Int {
        // Dictionary to store the frequency of each word.
        var countDict = [String: Int]()
        // Length of the longest palindrome.
        var res = 0
        // Flag to indicate if a palindrome with a single central character has been found.
        var hasCenter = false

        // Count the frequency of each word.
        for word in words {
            countDict[word, default: 0] += 1 //Use default: 0 to handle cases where word isn't in dictionary yet.
        }

        // Process pairs of words and their reverses.
        for (word, freq) in countDict {
            let reversed = String(word.reversed()) //Create the reversed version of the word.

            //If the word is not a palindrome itself (word != reversed)...
            if word != reversed {
                //If both word and its reversed exist in the dictionary...
                if let freq1 = countDict[word], let freq2 = countDict[reversed] {
                    //Calculate how many pairs can be formed.
                    let pairCount = min(freq1, freq2)
                    //Each pair contributes 4 to the total length (e.g., "ab" + "ba").
                    res += pairCount * 4
                    //Reduce the frequency of the words after forming the pairs.
                    countDict[word]! -= pairCount
                    countDict[reversed]! -= pairCount
                }
            }
        }

        //Process words that are palindromes themselves.
        for (word, freq) in countDict {
            if word == String(word.reversed()) { //Check if it's a palindrome.
                //Each pair of palindromes contributes 4 to the length.
                res += (freq / 2) * 4

                //If there's an odd number of palindromes and we haven't found a center, add 2.
                if freq % 2 == 1 && !hasCenter {
                    res += 2
                    hasCenter = true
                }
            }
        }

        return res // Return the total length of the longest palindrome.
    }
}

/*
Explanation in simple words:

The function first counts the frequency of each word. Then it looks for pairs of words that are reversals of each other (for example, "ab" and "ba"). Each such pair adds 4 to the length of the longest palindrome. After processing the pairs, the function processes words that are themselves palindromes. Each pair of such palindromes also adds 4 to the length of the palindrome. If there is an unpaired number of any palindrome, 2 is added to the length of the palindrome (one character is added to the center).

The algorithm runs in linear time O(n), where n is the total number of characters in all words, since walking through dictionaries and reversing strings takes linear time.
*/
