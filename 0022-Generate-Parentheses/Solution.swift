//
// 0022. Generate Parentheses
// Link: https://leetcode.com/problems/generate-parentheses/
// SwiftLeetCode
//

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var memo = [String: [String]]() // Create a memoization dictionary to avoid repeated calculations

        // Define the recursive function using Dynamic Programming
        func dp(_ open: Int, _ close: Int) -> [String] {
            let key = "\(open),\(close)" // Create a unique key for the current state

            if let cached = memo[key] {
                return cached // Return cached result if already computed
            }

            if open == 0 && close == 0 {
                return [""] // Base case: no more parentheses to add
            }

            var res: [String] = [] // This will store all valid combinations for this state

            if open > 0 {
                // If we can still add an open parenthesis
                for s in dp(open - 1, close) {
                    res.append("(" + s) // Add '(' and recurse
                }
            }

            if close > open {
                // We can only add ')' if there are more close than open left
                for s in dp(open, close - 1) {
                    res.append(")" + s) // Add ')' and recurse
                }
            }

            memo[key] = res // Save result to memo dictionary
            return res // Return list of valid combinations
        }

        return dp(n, n) // Start with n open and n close parentheses
    }
}

