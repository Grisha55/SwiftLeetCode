class Solution {
  func flatten(_ root: TreeNode?) {
    guard let root = root else { return }
    var stack: [TreeNode] = [root]
    var prev: TreeNode? = nil

    // Using stack to perform a pre-order traversal and modify the tree in place
    while !stack.isEmpty {
      let node = stack.removeLast()
      if let right = node.right {
        stack.append(right)
      }

      if let left = node.left {
        stack.append(left)
      }

      if let prev = prev {
        prev.right = node
        prev.left = nil
      }

      prev = node
    }
  }
}