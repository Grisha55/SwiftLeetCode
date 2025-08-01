//
// 100. Same Tree
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

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // If nodes are nil, nodes are equal (come to the end)
        if p == nil && q == nil {
            return true
        }

        // If one of nodes is nill and other not - trees are different
        if p == nil || q == nil {
            return false
        }

        // If nodes values are different, trees are different too
        if p!.val != q!.val {
            return false
        }

        // Recursively check left and right subtrees
        return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }
}
