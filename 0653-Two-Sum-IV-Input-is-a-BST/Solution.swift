class Solution {
  func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    guard let root = root else { return false }
    var stack: [TreeNode] = []
    var seen: Set<Int> = []

    // Using stack to perform an in-order traversal
    stack.append(root)

    while !stack.isEmpty {
      let node = stack.removeLast()

      // Check if the complement exists
      if seen.contains(k - node.val) {
        return true
      }

      // Add the current node's value to the set
      seen.insert(node.val)

      // Push right and left children onto the stack
      if let right = node.right {
        stack.append(right)
      }
      if let left = node.left {
        stack.append(left)
      }
    }

    return false
  }
}