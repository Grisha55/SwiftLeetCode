# 0001. Two Sum

## Description

There exist two **undirected** trees with `n` and `m` nodes, with **distinct** labels in ranges `[0, n - 1]` and `[0, m - 1]`, respectively.

You are given two 2D integer arrays `edges1` and `edges2` of lengths `n - 1` and `m - 1`, respectively, where `edges1[i] = [ai, bi]` indicates that there is an edge between nodes `ai` and `bi` in the first tree and `edges2[i] = [ui, vi]` indicates that there is an edge between nodes `ui` and `vi` in the second tree. You are also given an integer `k`.

Node `u` is **target** to node `v` if the number of edges on the path from `u` to `v` is less than or equal to `k`. **Note** that a node is always **target** to itself.

Return an array of `n` integers `answer`, where `answer[i]` is the **maximum** possible number of nodes **target** to node `i` of the first tree if you have to connect one node from the first tree to another node in the second tree.

**Note** that queries are independent from each other. That is, for every query you will remove the added edge before proceeding to the next query.

## Example

**Input:**  
 edges1 = [[0,1],[0,2],[2,3],[2,4]], edges2 = [[0,1],[0,2],[0,3],[2,7],[1,4],[4,5],[4,6]], k = 2
<br>
**Output:**
<br>
[9,7,9,8,8]
<br>
**Explanation:**
<br>
- For `i = 0`, connect node 0 from the first tree to node 0 from the second tree.
- For `i = 1`, connect node 1 from the first tree to node 0 from the second tree.
- For `i = 2`, connect node 2 from the first tree to node 4 from the second tree.
- For `i = 3`, connect node 3 from the first tree to node 4 from the second tree.
- For `i = 4`, connect node 4 from the first tree to node 4 from the second tree.

## Constraints

- `2 <= n, m <= 1000`
- `edges1.length == n - 1`
- `edges2.length == m - 1`
- `edges1[i].length == edges2[i].length == 2`
- `edges1[i] = [ai, bi]`
- `0 <= ai, bi < n`
- `edges2[i] = [ui, vi]`
- `0 <= ui, vi < m`
- The input is generated such that `edges1` and `edges2` represent valid trees.
- `0 <= k <= 1000`
