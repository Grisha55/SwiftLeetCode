//
// 3373. Maximize the Number of Target Nodes After Connecting Trees II
// Problem: https://leetcode.com/problems/maximize-the-number-of-target-nodes-after-connecting-trees-ii/description/
// SwiftLeetCode
// Made it with C++
//

class Solution {
public:
    // Depth-First Search function to color nodes and count nodes of each color.
    int dfs(int node, int parent, int depth, // node: current node, parent: parent node, depth: depth from root
            const vector<vector<int>>& children, vector<int>& color) { // children: adjacency list of the graph, color: array to store node colors
        int res = 1 - depth % 2; // Initialize result. The color alternates between 0 and 1 at each depth. This is a key part of the algorithm.
        color[node] = depth % 2; // Color the current node based on its depth.
        for (int child : children[node]) { // Iterate through the children of the current node.
            if (child == parent) { // Skip the parent node to avoid cycles.
                continue;
            }
            res += dfs(child, node, depth + 1, children, color); // Recursively call dfs for each child.
        }
        return res; // Return the count of nodes with the opposite color.
    }

    // Function to build the graph's adjacency list and perform DFS to count nodes with each color.
    vector<int> build(const vector<vector<int>>& edges, vector<int>& color) { // edges: edges of the graph, color: array to store node colors
        int n = edges.size() + 1; // Number of nodes in the graph.
        vector<vector<int>> children(n); // Adjacency list to represent the graph.
        for (const auto& edge : edges) { // Iterate through the edges.
            children[edge[0]].push_back(edge[1]); // Add edge to the adjacency list.
            children[edge[1]].push_back(edge[0]); // Add edge in both directions (undirected graph).
        }
        int res = dfs(0, -1, 0, children, color); // Perform DFS starting from node 0.
        return {res, n - res}; // Return the counts of nodes with color 0 and color 1.
    }

    // Main function to calculate the maximum reachable nodes for each node in edges1.
    vector<int> maxTargetNodes(vector<vector<int>>& edges1,
                               vector<vector<int>>& edges2) { // edges1 and edges2 are the two graphs.
        int n = edges1.size() + 1, m = edges2.size() + 1; // Number of nodes in each graph.
        vector<int> color1(n); // Array to store colors for nodes in graph1.
        vector<int> color2(m); // Array to store colors for nodes in graph2.
        vector<int> count1 = build(edges1, color1); // Count nodes of each color in graph1.
        vector<int> count2 = build(edges2, color2); // Count nodes of each color in graph2.
        vector<int> res(edges1.size() + 1); // Array to store results.
        for (int i = 0; i < n; i++) { // Iterate through each node in graph1.
            res[i] = count1[color1[i]] + max(count2[0], count2[1]); // Calculate the maximum reachable nodes for each node in graph1, this is a simplification. The actual number may vary.
        }
        return res; // Return the array of maximum reachable nodes.
    }
};

/*
In Simple Terms:

The algorithm cleverly uses a two-coloring scheme based on node depth in a DFS traversal. The `dfs` function assigns colors (0 or 1) alternating with depth, counting nodes of each color. The `build` function constructs the graph's adjacency list and performs the DFS. The `maxTargetNodes` function then combines the counts from both graphs, assuming a simplified combination method for the final result. The core idea is that the bi-coloring helps to approximate the maximum number of reachable nodes, albeit with a potential simplification in the final combination step. This solution may not always provide the precise maximum reachable nodes, but it offers a reasonably efficient approximation.
*/
