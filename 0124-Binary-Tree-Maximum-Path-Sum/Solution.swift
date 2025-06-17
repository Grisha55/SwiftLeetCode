//
// 0124. Binary Tree Maximum Path Sum
// Ptoblem: https://leetcode.com/problems/binary-tree-maximum-path-sum/
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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min // maximum sum

        func maxGain(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            // Find how much you can “earn” the maximum by going through the current node down - either left or right.
            let leftGain = max(maxGain(node.left), 0)   // Recursively call maxGain for the left subtree.
            let rightGain = max(maxGain(node.right), 0) // Recursively call maxGain for the right subtree.
            // We take only positive values. If maxGain returns a negative number, ignore it (i.e., cut the bad path).

            // Here we consider the case where the current node is the “peak” of the path, and the path goes left and right from it.
            // This is important because for the global maximum we can take both sides at once.
            maxSum = max(maxSum, node.val + leftGain + rightGain) // update maxSum

            // Return the maximum of one of the branches:
            return node.val + max(leftGain, rightGain)
            // This value is returned up the recursion, that is, to the parent.
            // The parent cannot take both branches at once, because the path must be unbranched (just a chain).
        }

        // Start the algorithm
        _ = maxGain(root)
        return maxSum
    }

    /*
        Simple explanation:
        1. We walk up the tree and at each node we decide:
            - Which is more profitable: going left, going right, or going nowhere.
            - How much maximum we can get if we go down through that node.
            - Update the global maximum if the node with both children gives the best path.

        2. The result is the largest amount that can be gained in any part of the tree.
    */
}
