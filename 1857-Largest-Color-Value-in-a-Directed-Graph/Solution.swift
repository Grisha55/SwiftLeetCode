//
// 1857. Largest Color Value in a Directed Graph
// Problem: https://leetcode.com/problems/largest-color-value-in-a-directed-graph/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
        // Number of nodes in the graph.
        let n = colors.count
        // Array of colors.
        let colorArr = Array(colors)
        // Adjacency list representation of the graph.
        var graph = [[Int]](repeating: [], count: n)
        // In-degree of each node (number of incoming edges).
        var indegree = [Int](repeating: 0, count: n)

        // Build the graph and calculate in-degrees.
        for edge in edges {
            let u = edge[0], v = edge[1]
            graph[u].append(v)
            indegree[v] += 1
        }

        // DP table: dp[i][c] stores the maximum count of color 'c' along any path ending at node 'i'.
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 26), count: n)
        // Queue for topological sort using Kahn's algorithm.
        var queue = [Int]()

        // Add nodes with in-degree 0 to the queue.
        for i in 0..<n {
            if indegree[i] == 0 {
                queue.append(i)
                // Initialize DP for nodes with in-degree 0. The color at the node is counted once.
                let colorIndex = Int(colorArr[i].asciiValue! - Character("a").asciiValue!)
                dp[i][colorIndex] = 1
            }
        }

        // Count of visited nodes.
        var seen = 0
        // Maximum count of any color along any path.
        var result = 0

        // Topological sort and DP calculation.
        while !queue.isEmpty {
            let u = queue.removeFirst()
            seen += 1
            // Update the maximum count of colors seen.
            let uColorIndex = Int(colorArr[u].asciiValue! - Character("a").asciiValue!)
            result = max(result, dp[u][uColorIndex])

            // Iterate through neighbors.
            for v in graph[u] {
                // Iterate through all colors.
                for c in 0..<26 {
                    //Increment if this neighbor node's color matches the current color.
                    let increment = (Int(colorArr[v].asciiValue! - Character("a").asciiValue!) == c) ? 1 : 0
                    //Update the DP value for the neighbor, taking the max of existing and new values.
                    dp[v][c] = max(dp[v][c], dp[u][c] + increment)
                }
                // Decrement in-degree of neighbor.
                indegree[v] -= 1
                // Add neighbor to queue if its in-degree becomes 0.
                if indegree[v] == 0 {
                    queue.append(v)
                }
            }
        }

        // If all nodes were visited (no cycles), return the result; otherwise, return -1 (cycle detected).
        return seen == n ? result : -1
    }
}

/*
Explanation in simple words:

The function uses topological sorting (Kahn's algorithm) to traverse the OAG. `dp[i][c]` stores the maximum number of occurrences of color `c` on all paths ending at node `i`. The function traverses the graph in topological order, updating the `dp` values ​​for each node based on the `dp` values ​​of its predecessors. If there are cycles in the graph, topological sorting is impossible and the function returns -1. Otherwise, it returns the maximum value found in the `dp` table. Color is converted from a symbol to a numeric index for ease of storage in an array.

Time complexity is O(V + E), where V is the number of vertices and E is the number of edges. Space complexity is also O(V + E) due to the graph representation and DP table.
*/
