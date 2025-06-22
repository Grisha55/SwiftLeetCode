//
// 3372. Maximize the Number of Target Nodes After Connecting Trees I
// Problem: https://leetcode.com/problems/maximize-the-number-of-target-nodes-after-connecting-trees-i/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    // Helper function to build an adjacency list representation of a graph.
    func buildGraph(_ edges: [[Int]], _ size: Int) -> [[Int]] {
        var graph = Array(repeating: [Int](), count: size) // Initialize an adjacency list (graph) of size 'size'.
        for edge in edges { // Iterate through the given edges.
            let u = edge[0] // Extract the first node of the edge.
            let v = edge[1] // Extract the second node of the edge.
            graph[u].append(v) // Add an edge from u to v.
            graph[v].append(u) // Add an edge from v to u (assuming undirected graph).
        }
        return graph // Return the built graph.
    }

    // Helper function to perform BFS and count nodes at each distance from a starting node.
    func bfsDistanceCount(_ graph: [[Int]], _ size: Int) -> [[Int]] {
        var result = Array(repeating: Array(repeating: 0, count: size), count: size) // Initialize a 2D array to store the counts of nodes at each distance from each starting node.

        for start in 0..<size { // Iterate through each node as a starting point.
            var visited = Array(repeating: false, count: size) // Keep track of visited nodes in BFS.
            var queue: [(node: Int, dist: Int)] = [(start, 0)] // Queue for BFS, stores (node, distance).
            visited[start] = true // Mark the starting node as visited.

            while !queue.isEmpty { // While the queue is not empty.
                let (node, dist) = queue.removeFirst() // Get the next node and its distance.
                result[start][dist] += 1 // Increment the count of nodes at this distance.

                for neighbor in graph[node] { // Iterate through neighbors of the current node.
                    if !visited[neighbor] { // If the neighbor hasn't been visited.
                        visited[neighbor] = true // Mark it as visited.
                        queue.append((neighbor, dist + 1)) // Add the neighbor to the queue with incremented distance.
                    }
                }
            }
        }
        return result // Return the distance counts.
    }

    // Helper function to calculate prefix sums of distance counts. This optimizes the later maxReach calculation.
    func buildPrefix(_ count: [[Int]], _ size: Int) -> [[Int]] {
        var prefix = count // Create a copy of the count array.
        for i in 0..<size { // Iterate through each row (starting node).
            for d in 1..<size { // Iterate through each distance (column).
                prefix[i][d] += prefix[i][d - 1] // Add the previous distance's count to the current distance's count (prefix sum).
            }
        }
        return prefix // Return the array with prefix sums.
    }

    func maxTargetNodes(_ edges1: [[Int]], _ edges2: [[Int]], _ k: Int) -> [Int] {
        let n = edges1.count + 1 // Number of nodes in graph1.
        let m = edges2.count + 1 // Number of nodes in graph2.

        let graph1 = buildGraph(edges1, n) // Build graph1.
        let graph2 = buildGraph(edges2, m) // Build graph2.

        let distCount1 = bfsDistanceCount(graph1, n) // Count nodes at each distance in graph1.
        let distCount2 = bfsDistanceCount(graph2, m) // Count nodes at each distance in graph2.

        let prefix1 = buildPrefix(distCount1, n) // Calculate prefix sums for graph1.
        let prefix2 = buildPrefix(distCount2, m) // Calculate prefix sums for graph2.

        var answer = [Int]() // Array to store the maximum reachable nodes for each node in graph1.

        for i in 0..<n { // Iterate through each node in graph1.
            var maxReach = 0 // Initialize the maximum reachable nodes.
            for j in 0..<m { // Iterate through each node in graph2.
                let fromTree1 = prefix1[i][min(k, n - 1)] // Number of nodes reachable within distance k in graph1.
                let fromTree2 = (k - 1 >= 0) ? prefix2[j][min(k - 1, m - 1)] : 0 // Number of nodes reachable within distance k-1 in graph2 (adjusting for the combined distance).
                maxReach = max(maxReach, fromTree1 + fromTree2) // Update maxReach if a larger number is found.
            }
            answer.append(maxReach) // Add maxReach to the answer.
        }
        return answer // Return the answer array.
    }
}

/*
In Simple Terms:

The code efficiently finds the maximum number of nodes reachable within distance k from each node in graph1, considering nodes reachable in graph2 as well. It first builds the graphs, then uses BFS to count reachable nodes at each distance. Prefix sums are used to quickly calculate the total number of reachable nodes within distance k. Finally, it iterates through all node pairs (one from each graph) to find the maximum reachable nodes for each node in graph1. The use of helper functions improves code readability and organization.
*/
