//
// 2014. Longest Subsequence Repeated k Times
// SwiftLeetCode
//

import Foundation

class Solution {
    
    // Checks if `target` is a subsequence of `s`
    func isSubsequence(_ s: String, _ target: String) -> Bool {
        var i = 0, j = 0
        let sArray = Array(s)
        let tArray = Array(target)
        
        while i < sArray.count && j < tArray.count {
            if sArray[i] == tArray[j] {
                j += 1
            }
            i += 1
        }
        
        return j == tArray.count
    }

    var result = ""
    var s = ""
    var k = 0

    func longestSubsequenceRepeatedK(_ s: String, _ k: Int) -> String {
        self.s = s
        self.k = k
        result = ""

        // Count character frequencies
        var freq = [Character: Int]()
        for c in s {
            freq[c, default: 0] += 1
        }

        // Keep only characters that appear at least k times
        let candidates = freq.filter { $0.value >= k }.map { $0.key }.sorted(by: >)

        // Maximum length of sequence we can repeat k times
        let maxLen = s.count / k

        // Start DFS to build possible sequences
        dfs("", candidates, maxLen)

        return result
    }

    // DFS with pruning to find the best sequence
    func dfs(_ path: String, _ candidates: [Character], _ maxLen: Int) {
        if path.count > maxLen { return }

        if !path.isEmpty {
            // Build repeated string: path * k
            let repeated = String(repeating: path, count: k)
            // Check if repeated string is a subsequence of s
            if isSubsequence(s, repeated) {
                // Update result if path is better
                if path.count > result.count || (path.count == result.count && path > result) {
                    result = path
                }
            } else {
                // Stop recursion early if repeated is not a valid subsequence
                return
            }
        }

        // Try adding each candidate character to current path
        for ch in candidates {
            dfs(path + String(ch), candidates, maxLen)
        }
    }
}


/*
🔍 Step-by-step explanation:

1. Overall Goal
We want to find the longest subsequence seq such that if we repeat it k times (i.e. seq * k), it is still a subsequence of the original string s.

2. Function isSubsequence(s, target)
This function checks if the target string is a subsequence of s.
- It uses two pointers i and j to walk through both strings.
- It tries to match all characters of target inside s in order.
- If we can reach the end of target, it means target is a valid subsequence.

3. Character frequency count
var freq = [Character: Int]()
for c in s {
    freq[c, default: 0] += 1
}
We count how many times each character appears in string s.
This helps us later to filter out characters that cannot possibly form a valid sequence repeated k times.

4. Filtering useful characters
let candidates = freq.filter { $0.value >= k }.map { $0.key }.sorted(by: >)
- We only keep characters that appear at least k times — otherwise, they can't be used k times in a repeated sequence.
- We sort them in descending lexicographical order so we prioritize larger sequences first.

5. Define max length for a candidate sequence
let maxLen = s.count / k
- If a sequence is longer than s.count / k, then seq * k would be longer than s, so we can't use it.

6. Start recursive DFS (depth-first search)
dfs("", candidates, maxLen)
We begin trying to build sequences starting from an empty string.
We recursively build all possible paths (combinations of characters) using only the filtered candidate characters.

7. DFS Function: Building and Pruning
func dfs(_ path: String, _ candidates: [Character], _ maxLen: Int)
This function builds sequences by:
    1. Checking length limit: if the current sequence is too long, we stop.
    2. Checking if path * k is a valid subsequence:
        - If yes, we consider updating our result.
        - If no, we return early (prune the recursion) — no need to check longer paths based on this.
    3. Trying to extend path with each character in candidates (in order of priority).

8. Result update condition
if path.count > result.count || (path.count == result.count && path > result)
We always prefer:
    - Longer sequences
    - If lengths are equal, lexicographically larger sequences (e.g. "bca" > "abc")

9. Final output
After trying all possible combinations (with efficient pruning), we return the best sequence we found — the longest, most lexicographically powerful one that satisfies the condition.

*/
