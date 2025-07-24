//
// 2322. Minimum Score After Removals on a Tree
// SwiftLeetCode
//

class Solution {
    func minimumScore(_ nums: [Int], _ edges: [[Int]]) -> Int {
        let n = nums.count
        // Adjacency list to represent the tree structure
        var adj = [[Int]](repeating: [], count: n)
        // Array to store parent of each node
        var parent = [Int](repeating: -1, count: n)
        // Array to store XOR of subtree rooted at each node
        var xor = [Int](repeating: 0, count: n)
        // Arrays to track entry and exit times in DFS traversal
        var inTime = [Int](repeating: 0, count: n)
        var outTime = [Int](repeating: 0, count: n)
        var time = 0
        
        // Build the adjacency list
        for edge in edges {
            let a = edge[0], b = edge[1]
            adj[a].append(b)
            adj[b].append(a)
        }
        
        // DFS function to compute necessary tree properties
        func dfs(_ u: Int, _ p: Int) {
            parent[u] = p           // Set parent of current node
            inTime[u] = time       // Record entry time
            time += 1
            xor[u] = nums[u]       // Initialize with node's own value
            
            // Visit all neighbors except parent
            for v in adj[u] where v != p {
                dfs(v, u)
                xor[u] ^= xor[v]   // Accumulate XOR of subtree
            }
            
            outTime[u] = time - 1   // Record exit time
        }
        
        // Start DFS from root node (0)
        dfs(0, -1)
        
        var minScore = Int.max
        
        // Check all possible pairs of edges to remove
        for i in 0..<edges.count {
            let a = edges[i][0], b = edges[i][1]
            // Determine parent-child relationship for first edge
            let (child1, parent1) = parent[a] == b ? (a, b) : (b, a)
            
            for j in (i + 1)..<edges.count {
                let c = edges[j][0], d = edges[j][1]
                // Determine parent-child relationship for second edge
                let (child2, parent2) = parent[c] == d ? (c, d) : (d, c)
                
                let x: Int, y: Int, z: Int
                
                // Check if one subtree is contained within the other
                if isAncestor(child1, child2) {
                    // Case 1: child2 is in child1's subtree
                    x = xor[child2]
                    y = xor[child1] ^ xor[child2]
                    z = xor[0] ^ xor[child1]
                } else if isAncestor(child2, child1) {
                    // Case 2: child1 is in child2's subtree
                    x = xor[child1]
                    y = xor[child2] ^ xor[child1]
                    z = xor[0] ^ xor[child2]
                } else {
                    // Case 3: Subtrees are independent
                    x = xor[child1]
                    y = xor[child2]
                    z = xor[0] ^ xor[child1] ^ xor[child2]
                }
                
                // Calculate current score and update minimum
                let currentMax = max(x, y, z)
                let currentMin = min(x, y, z)
                minScore = min(minScore, currentMax - currentMin)
            }
        }
        
        return minScore
        
        // Helper function to check if a is ancestor of b
        func isAncestor(_ a: Int, _ b: Int) -> Bool {
            return inTime[a] <= inTime[b] && outTime[a] >= outTime[b]
        }
    }
}

/*
Time Complexity - O(n^2)
Space Complexity - O(n)
*/
