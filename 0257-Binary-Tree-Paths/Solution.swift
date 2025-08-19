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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res = [String]()

        func dfs(_ node: TreeNode?, _ path: String) {
            guard let node = node else { return }
            let newPath = path.isEmpty ? "\(node.val)" : path + "->" + "\(node.val)"

            if node.left == nil && node.right == nil {
                res.append(newPath)
            } else {
                dfs(node.left, newPath)
                dfs(node.right, newPath)
            }
        }

        dfs(root, "")
        return res
    }
}