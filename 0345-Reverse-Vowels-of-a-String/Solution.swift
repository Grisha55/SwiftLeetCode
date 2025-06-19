//
// 0345. Reverse Vowels of a String
// Problem: https://leetcode.com/problems/reverse-vowels-of-a-string/
// SwiftLeetCode
//

import Foundation

class Solution {
    func reverseVowels(_ s: String) -> String {

        // Create a set of vowels for efficient lookup. Sets provide O(1) lookup time.
        let vowels: Set<Character> = ["a", "e", "i", "o", "u",
                                      "A", "E", "I", "O", "U"]

        // Convert the string to an array of characters for easier manipulation.
        var chars = Array(s)

        // Initialize two pointers, 'left' and 'right', to the beginning and end of the array respectively.
        var left = 0
        var right = chars.count - 1

        // The main loop continues as long as the 'left' pointer is to the left of the 'right' pointer.
        while left < right {
            
            // Inner loop to find the next vowel from the left. It skips over consonants.
            while left < right && !vowels.contains(chars[left]) {
                left += 1
            }

            // Inner loop to find the next vowel from the right. It skips over consonants.
            while left < right && !vowels.contains(chars[right]) {
                right -= 1
            }

            // If both pointers found vowels (and haven't crossed), swap them.
            if left < right {
                chars.swapAt(left, right)

                // Move pointers towards the middle.
                left += 1
                right -= 1
            }
        }

        // Convert the modified character array back to a string and return it.
        return String(chars)
    }
}

/*
Explanation in simple terms:

The function uses a two-pointer approach similar to string reversal. However, instead of swapping any two characters, it only swaps vowels. The inner `while` loops efficiently skip over consonants, finding the next vowel from both the left and right sides. Once two vowels are found, they are swapped, and the pointers move closer to the middle. This continues until the pointers cross each other, indicating that all vowels have been reversed. The use of a `Set` for vowels makes checking for vowels very efficient (constant time).


Example:

Let's say `s = "hello"`.

1. `chars` becomes `['h', 'e', 'l', 'l', 'o']`.
2. The left pointer finds 'e', and the right pointer finds 'o'. They are swapped, resulting in `['h', 'o', 'l', 'l', 'e']`.
3. The pointers move, and the loop continues until the pointers cross.
4. The final result is `'holle'`. The consonants ('h', 'l', 'l') remain in their original positions.

The function efficiently reverses only the vowels, leaving the consonants untouched. The time complexity is O(n), where n is the length of the string, because it iterates through the string at most once. The space complexity is O(n) due to the creation of the `chars` array, but this is unavoidable because strings in Swift are immutable.
*/
