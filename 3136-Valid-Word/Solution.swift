//
// 3136. Valid Word
// SwiftLeetCode
//

class Solution {
    func isValid(_ word: String) -> Bool {
        guard word.count >= 3 else { return false }

        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var hasVowel = false
        var hasConsonant = false

        for char in word {
            if !char.isLetter && !char.isNumber {
                return false
            }

            if vowels.contains(char) {
                hasVowel = true
            }
            
            else if char.isLetter {
                hasConsonant = true
            }
        }

        return hasVowel && hasConsonant
    }
}

/*
Time Complexity
O(n)

Space Complexity
O(1)
*/
