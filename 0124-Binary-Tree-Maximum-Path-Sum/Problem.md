# 124. Binary Tree Maximum Path Sum

## Description

**A path** in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence **at most once**. Note that the path does not need to pass through the root.

The **path sum** of a path is the sum of the node's values in the path.

Given the `root` of a binary tree, return the maximum **path sum** of any **non-empty** path.

## Example

**Input:**  
<br>
root = [1,2,3]
<br>
**Output:**
<br>
6
<br>
**Explanation:**
<br>
The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.

## Constraints

- The number of nodes in the tree is in the range `[1, 3 * 10^4]`.
- `-1000 <= Node.val <= 1000`
