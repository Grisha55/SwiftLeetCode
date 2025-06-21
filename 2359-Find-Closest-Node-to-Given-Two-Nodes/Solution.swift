//
// 2359. Find Closest Node to Given Two Nodes
// Problem: https://leetcode.com/problems/find-closest-node-to-given-two-nodes/description/
// SwiftLeetCode
// Can't decide this task with Swift. Made it with C++
//

class Solution {
public:
    // Performs Breadth-First Search (BFS) to calculate distances from a starting node.
    void bfs(int startNode, vector<int>& edges, vector<int>& dist) {
        int n = edges.size(); // Get the number of nodes in the graph.
        queue<int> q; // Create a queue for BFS.
        q.push(startNode); // Add the starting node to the queue.

        vector<bool> visit(n, false); // Boolean array to track visited nodes. Initialize all to false.
        dist[startNode] = 0; // Distance from startNode to itself is 0.

        while (!q.empty()) { // Continue BFS until the queue is empty.
            int node = q.front(); // Get the next node from the queue.
            q.pop(); // Remove it from the queue.

            if (visit[node]) { // If the node has already been visited, skip it.
                continue;
            }

            visit[node] = true; // Mark the node as visited.
            int neighbor = edges[node]; // Get the neighbor of the current node.
            if (neighbor != -1 && !visit[neighbor]) { // If a neighbor exists and hasn't been visited...
                dist[neighbor] = 1 + dist[node]; // ...set its distance and add it to the queue.
                q.push(neighbor);
            }
        }
    }

    // Finds the closest node where paths from node1 and node2 meet.
    int closestMeetingNode(vector<int>& edges, int node1, int node2) {
        int n = edges.size(); // Number of nodes.
        vector<int> dist1(n, numeric_limits<int>::max()), dist2(n, numeric_limits<int>::max()); // Initialize distance vectors with maximum possible integer value.

        bfs(node1, edges, dist1); // Perform BFS from node1 to fill dist1.
        bfs(node2, edges, dist2); // Perform BFS from node2 to fill dist2.

        int minDistNode = -1, minDistTillNow = numeric_limits<int>::max(); // Initialize the closest node and minimum distance.
        for (int currNode = 0; currNode < n; currNode++) { // Iterate through all nodes.
            //If the maximum distance from both starting nodes to the current node is less than current minimum distance...
            if (minDistTillNow > max(dist1[currNode], dist2[currNode])) {
                minDistNode = currNode; //Update the closest node
                minDistTillNow = max(dist1[currNode], dist2[currNode]); //Update the minimum distance
            }
        }

        return minDistNode; // Return the index of the closest meeting node.
    }
};

/*
Explanation in Simple Terms:

The `closestMeetingNode` function finds the node that is the closest to both `node1` and `node2` in terms of the shortest path distance. It does this by:

1. Performing BFS from both starting nodes: It uses the `bfs` helper function to calculate the shortest path distances from `node1` (`dist1`) and `node2` (`dist2`) to all other nodes in the graph. If a node is unreachable from a starting node, its distance remains the maximum possible integer value.

2. Finding the node with the minimum maximum distance: It iterates through all nodes, calculating the maximum distance from each node to both `node1` and `node2`. The node with the smallest maximum distance is the closest meeting node.

The `bfs` function is a standard breadth-first search implementation. It explores the graph level by level, calculating the shortest distance from the starting node to all reachable nodes.

The time complexity is dominated by the two BFS calls, resulting in O(V + E) time, where V is the number of vertices (nodes) and E is the number of edges. The space complexity is O(V) to store the distance arrays and the visited array.
*/
