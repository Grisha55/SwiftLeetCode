//
//  0017. Letter Combinations of a Phone Number
//  Problem: https://leetcode.com/problems/letter-combinations-of-a-phone-number/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        // If the input is empty, return an empty array
        if digits.isEmpty { return [] }

        // Dictionary mapping each digit to its corresponding letters
        let digitToLetters: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]

        var result: [String] = []

        // Helper function to perform backtracking
        func backtrack(_ index: Int, _ path: String) {
            // If we've processed all digits, add the current combination to the result
            if index == digits.count {
                result.append(path)
                return
            }

            // Get the digit at the current index
            let digit = digits[digits.index(digits.startIndex, offsetBy: index)]

            // Get the corresponding letters for the digit
            guard let letters = digitToLetters[digit] else { return }

            // Iterate through the letters and continue building the combinations
            for letter in letters {
                backtrack(index + 1, path + String(letter))
            }
        }

        // Start backtracking from the first digit
        backtrack(0, "")
        return result
    }
}

