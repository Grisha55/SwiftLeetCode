//
// 1061. Lexicographically Smallest Equivalent String
// Problem: https://leetcode.com/problems/lexicographically-smallest-equivalent-string/
// SwiftLeetCode
//

import Foundation

class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        // Union-Find structure to track parent of each character from 'a' to 'z'
        var parent = Array(0..<26) // parent[i] = i initially

        // Find the representative (root) of the group containing x
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x]) // path compression
            }
            return parent[x]
        }

        // Union two groups by choosing the lexicographically smaller root as the parent
        func union(_ x: Int, _ y: Int) {
            let px = find(x)
            let py = find(y)
            if px == py { return } // already in the same group
            if px < py {
                parent[py] = px // smaller character becomes parent
            } else {
                parent[px] = py
            }
        }

        // Convert input strings to arrays of characters for easier indexing
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)

        // Merge each pair of characters from s1 and s2
        for i in 0..<s1Chars.count {
            let a = Int(s1Chars[i].asciiValue! - Character("a").asciiValue!)
            let b = Int(s2Chars[i].asciiValue! - Character("a").asciiValue!)
            union(a, b)
        }

        // Build the resulting string by replacing each character in baseStr
        var result = ""
        for ch in baseStr {
            let idx = Int(ch.asciiValue! - Character("a").asciiValue!)
            let smallest = find(idx) // find smallest equivalent character
            result += String(UnicodeScalar(smallest + Int(Character("a").asciiValue!))!)
        }

        return result
    }

}

/*
🧠 What's the problem?
You have strings s1, s2 and baseStr.
Characters at the same positions in s1 and s2 are considered equivalent (e.g. s1 = "abc", s2 = "bcd" → a ≡ b, b ≡ c, c ≡ d).

The problem is to build the smallest lexicographic string based on baseStr, replacing each character with its smallest equivalent.

💡 How to solve it in simple words:
    1. We use the "Union-Find" structure to combine characters into groups of equivalent characters.
    2. When combining two characters, we always choose the smallest one as a "representative of the group" so that we can later replace all characters with the smallest possible ones.
    3. Then we simply iterate over baseStr and for each character, take its "smallest equivalent" from the group.


🔍 Example:
s1 = "abc"
s2 = "bcd"
baseStr = "acd"
So:
    - a ≡ b, b ≡ c, c ≡ d → all a, b, c, d are now in one group.
    - The smallest of them is a.
    - So, each a, c, d can be replaced by a.
Answer: "aaa"

📊 Complexity:
Time: O(N * α(N)), where α(N) is a very slowly growing function (almost like O(1)), due to path compression in Union-Find.
Memory: O(1), because the parent array is of fixed size (26 letters of the Latin alphabet).
*/
