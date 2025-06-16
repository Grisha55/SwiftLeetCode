//
// 0094. Binary Tree Inorder Traversal
// Problem: https://leetcode.com/problems/binary-tree-inorder-traversal/
// SwiftLeetCode
//

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

import Foundation

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var r = [Int]()
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }
            dfs(node.left)
            r.append(node.val)
            dfs(node.right)
        }
        dfs(root)
        return r
    }
}
