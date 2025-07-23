//
// 1717. Maximum Score From Removing Substrings
// SwiftLeetCode
//

class Solution {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        // Convert the input string to an array of characters for easier manipulation
        var chars = Array(s)
        var totalScore = 0
        
        // Determine which substring ("ab" or "ba") gives a higher score and prioritize it
        let firstPriority: String
        let secondPriority: String
        let firstScore: Int
        let secondScore: Int
        
        if x > y {
            firstPriority = "ab"
            secondPriority = "ba"
            firstScore = x
            secondScore = y
        } else {
            firstPriority = "ba"
            secondPriority = "ab"
            firstScore = y
            secondScore = x
        }
        
        // Process the higher-priority substring first to maximize the score
        totalScore += process(&chars, pattern: firstPriority, score: firstScore)
        // Then process the lower-priority substring
        totalScore += process(&chars, pattern: secondPriority, score: secondScore)
        
        return totalScore
    }
    
    /// Helper function to process the string and remove occurrences of the given pattern
    /// - Parameters:
    ///   - chars: The character array representing the string (modified in-place)
    ///   - pattern: The substring to remove ("ab" or "ba")
    ///   - score: Points gained for each removal of the pattern
    /// - Returns: Total score obtained from removing all occurrences of the pattern
    private func process(_ chars: inout [Character], pattern: String, score: Int) -> Int {
        var stack = [Character]()  // Stack to simulate the string processing
        var currentScore = 0       // Score accumulated in this processing step
        let patternChars = Array(pattern)
        let firstChar = patternChars[0]  // First character of the pattern (e.g., 'a' for "ab")
        let secondChar = patternChars[1] // Second character of the pattern (e.g., 'b' for "ab")
        
        for char in chars {
            // Check if the top of the stack and the current character form the pattern
            if !stack.isEmpty && stack.last! == firstChar && char == secondChar {
                stack.removeLast()  // Remove the first character of the pattern from the stack
                currentScore += score  // Add the score for this removal
            } else {
                stack.append(char)  // Otherwise, push the character onto the stack
            }
        }
        
        // Update the original character array to the state after processing
        chars = stack
        return currentScore
    }
}

// Time Complexity: O(n), where n is the length of the string.
//   - We process the string twice (once for each pattern), but each pass is O(n).
//   - Stack operations (push/pop) are O(1) per character, so total time is linear.
//
// Space Complexity: O(n), due to the stack storage.
//   - In the worst case, the stack may store all characters (if no patterns are found).
