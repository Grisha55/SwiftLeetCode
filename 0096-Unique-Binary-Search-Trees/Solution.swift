//
// 0096. Unique Binary Search Trees
// Problem: https://leetcode.com/problems/unique-binary-search-trees/
// SwiftLeetCode
//

import Foundation

class Solution {
    
    // This is a classical dynamic programming problem based on Catalan numbers.
    func numTrees(_ n: Int) -> Int {
        
        // t[i] - number of trees that can be constructed from i nodes.
        var t = Array(repeating: 0, count: n + 1)
        t[0] = 1 // one empty tree can be constructed from 0 nodes.
        if n >= 1 {
            t[1] = 1 // from 1 node, only one tree.
        }

        if n >= 2 {
            for i in 2...n {     // i - how many total nodes we have.
                for j in 1...i { // j - Which node is selected as the root of the tree.
                    t[i] += t[j - 1] * t[i - j]
                }
            }
        }

        return t[n]
    }
}
