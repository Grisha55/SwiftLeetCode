class Solution {
  func isSymmetric(_ root: TreeNode?) -> Bool {
    return isMirror(root?.left, root?.right)
  }

  private func isMirror(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
    // Both nodes are nil, they are symmetric
    if l == nil && r == nil {
      return true
    }
    // One of the nodes is nil, they are not symmetric
    if l == nil || r == nil {
      return false
    }
    // Check values and recursively check children
    return l?.val == r?.val && isMirror(l?.left, r?.right) && isMirror(l?.right, r?.left)
  }
}