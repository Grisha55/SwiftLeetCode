# 0337. House Robber III

## Description

The thief has found himself a new place for his thievery again. There is only one entrance to this area, called `root`.

Besides the `root`, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if **two directly-linked houses were broken into on the same night.**

Given the `root` of the binary tree, return the maximum amount of money the thief can rob **without alerting the police.**

## Example

**Input:**  
root = [3,2,3,null,3,null,1]
<br>
**Output:**
<br>
7
<br>
**Explanation:**
<br>
Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.

## Constraints

- The number of nodes in the tree is in the range `[1, 10^4]`.
- `0 <= Node.val <= 10^4`
