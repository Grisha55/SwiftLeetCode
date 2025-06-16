//
// 0095. Unique Binary Search Trees II
// Problem: https://leetcode.com/problems/unique-binary-search-trees-ii/
// SwiftLeetCode
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 { return [] }
        return generateTreesHelper(1, n)
    }

    func generateTreesHelper(_ start: Int, _ end: Int) -> [TreeNode?] {
        var allTrees = [TreeNode?]()
    
        if start > end {
            // Base case: empty tree
            allTrees.append(nil)
            return allTrees
        }
    
        for i in start...end {
            // Generate all left subtrees with keys [start, i-1]
            let leftTrees = generateTreesHelper(start, i - 1)
            
            // Generate all right subtrees with keys [i+1, end]
            let rightTrees = generateTreesHelper(i + 1, end)
        
            // Connect all left and right subtrees with root i
            for left in leftTrees {
                for right in rightTrees {
                    let currentTree = TreeNode(i)
                    currentTree.left = left
                    currentTree.right = right
                    allTrees.append(currentTree)
                }
            }
        }
        return allTrees
    }
}
