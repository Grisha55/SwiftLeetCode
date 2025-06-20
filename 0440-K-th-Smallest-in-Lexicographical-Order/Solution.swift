//
// 0440. K-th Smallest in Lexicographical Order
// Problem: https://leetcode.com/problems/k-th-smallest-in-lexicographical-order/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        var curr = 1                // Start from the first prefix "1"
        var k = k - 1               // We already consider "1", so we decrement k
    
        while k > 0 {
            // Count how many numbers are between curr and curr + 1 in lexicographical order
            let steps = countSteps(n, curr, curr + 1)
        
            if steps <= k {
                // If the number of steps is less than or equal to k,
                // skip all those numbers and move to next prefix (curr + 1)
                curr += 1
                k -= steps
            } else {
                // Otherwise, move deeper into the current prefix (curr * 10)
                curr *= 10
                k -= 1              // We take 1 step down into this subtree
            }
        }
    
        return curr                 // Return the k-th smallest number
    }


    // This function counts how many numbers are in the lexicographical tree
    // between `first` and `last` under the limit `n`
    func countSteps(_ n: Int, _ first: Int, _ last: Int) -> Int {
        var steps = 0              // Count of valid numbers in range [first, last)
        var f = first
        var l = last

        while f <= n {
            // At each level, we add the number of valid nodes in this range
            steps += min(n + 1, l) - f

            // Go one level deeper in the tree
            f *= 10
            l *= 10
        }

        return steps               // Total count of numbers between `first` and `last`
    }

}

/*
🧠 Simple explanation:
Think of the lexicographic order as a traversal of a prefix tree (Trie):
    - The root is 1, its children are: 10, 11, ..., 19
    - Then 2, 20, and so on...

The function goes down this tree step by step, counting how many numbers can be found starting from a certain prefix, and decides whether to move further in (multiplying by 10), or to move on to the next "brother" (increasing by 1).
*/
