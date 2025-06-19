//
// 0337. House Robber III
// Problem: https://leetcode.com/problems/house-robber-iii/
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
    func rob(_ root: TreeNode?) -> Int {

        // Perform a depth-first search (DFS) starting from the root to calculate the maximum robbery amounts.
        let result = dfs(root)

        // Return the maximum of robbing the root or not robbing it.
        return max(result.robbed, result.notRobbed)
    }

    // Helper struct to return two values (robbed and notRobbed) from the recursive function.
    struct Result {
        var robbed: Int       // Maximum amount if this node is robbed.
        var notRobbed: Int    // Maximum amount if this node is not robbed.
    }

    // Recursive depth-first search function to traverse the binary tree.
    func dfs(_ node: TreeNode?) -> Result {

        // Base case: If the node is nil (empty), return 0 for both robbed and notRobbed.
        guard let node = node else {
            return Result(robbed: 0, notRobbed: 0)
        }

        // Recursively calculate the results for the left and right subtrees.
        let left = dfs(node.left)
        let right = dfs(node.right)

        // If we rob the current node, we cannot rob its children.
        let robbed = node.val + left.notRobbed + right.notRobbed

        // If we don't rob the current node, we can choose to rob or not rob its children, taking the maximum for each.
        let notRobbed = max(left.robbed, left.notRobbed) + max(right.robbed, right.notRobbed)

        // Return the results for the current node.
        return Result(robbed: robbed, notRobbed: notRobbed)
    }

}

/*
Explanation in simple terms:

The `rob` function initiates a depth-first search (`dfs`) of the binary tree. The `dfs` function is recursive and returns a `Result` struct containing two values for each node:

* `robbed`: The maximum amount of money you can rob if you rob the current node. This means you can't rob its children.
* `notRobbed`: The maximum amount of money you can rob if you *don't* rob the current node. This allows you to potentially rob its children.

The `dfs` function works by recursively calling itself on the left and right children of each node. It then calculates the `robbed` and `notRobbed` values for the current node based on the results from its children. The `max` function is used to choose the best option (rob or not rob) for each child.

Finally, the `rob` function returns the maximum of `robbed` and `notRobbed` for the root node, representing the maximum amount of money that can be robbed from the entire tree.


The cleverness lies in the use of dynamic programming through recursion. It efficiently explores all possible robbery combinations without needing to explicitly check every single possibility. The `Result` struct allows the function to elegantly propagate the best robbery amounts upward through the tree.
*/
