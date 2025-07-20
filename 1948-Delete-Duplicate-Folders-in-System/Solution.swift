//
// 1948. Delete Duplicate Folders in System
// SwiftLeetCode
//

class Solution {
    func deleteDuplicateFolder(_ paths: [[String]]) -> [[String]] {
        // Create root node of the file system tree
        let root = Node()

        // Build the folder tree structure from input paths
        for path in paths {
            var current = root
            for folder in path {
                // Create new node if folder doesn't exist
                if current.children[folder] == nil {
                    current.children[folder] = Node()
                }
                // Move to the child node
                current = current.children[folder]!
            }
        }

        // Dictionary to count occurrences of each serialized subtree
        var serialCount = [String: Int]()
        serializeAndCount(root, &serialCount)

        // Set to store identifiers of nodes marked for deletion
        var toDelete = Set<ObjectIdentifier>()
        markDuplicates(root, serialCount, &toDelete)

        // Array to store the final result paths
        var result = [[String]]()
        var path = [String]()
        collectPaths(root, &path, &result, toDelete)

        return result
    }

    // Node class representing a folder in the file system
    class Node {
        // Dictionary maping folder names to child nodes
        var children = [String: Node]()
    }

    // Serializes the subtree and counts occurrences of each structure
    func serializeAndCount(_ node: Node, _ serialCount: inout [String: Int]) -> String {
        // Base case: empty folder returns empty string
        if node.children.isEmpty {
            return ""
        }

        var serials = [String]()
        // Process children in alphabetical order for consistent serialization
        for (folder, child) in node.children.sorted(by: { $0.key < $1.key }) {
            // Recursvely serialize each child
            let childSerial = serializeAndCount (child, &serialCount)
            // Format: "folderName(childSerial)"
            serials.append("\(folder)(\(childSerial))")
        }

        // Combine all child serializaitions
        let serial = serials.joined()
        // Increment count for this serialization pattern
        serialCount[serial, default: 0] += 1
        return serial
    }

    // Marks duplicate subtrees for deletion
    func markDuplicates(_ node: Node, _ serialCount: [String: Int], _ toDelete: inout Set<ObjectIdentifier>) -> String {
        // Base case: empty folder
        if node.children.isEmpty {
            return ""
        }

        var serials = [String]()
        // Process children in alphabetical order
        for (folder, child) in node.children.sorted(by: { $0.key < $1.key }) {
            // Recursively mark duplicates in children
            let childSerial = markDuplicates(child, serialCount, &toDelete)
            serials.append("\(folder)(\(childSerial))")
        }

        let serial = serials.joined()
        // If this serialization appears more than once, mark for deletion
        if serialCount[serial, default: 0] > 1 {
            // Use ObjectIdentifier as unique identifier for the node
            toDelete.insert(ObjectIdentifier(node))
        }
        return serial
    }

    // Collects all paths that aren't marked for deletion
    func collectPaths(_ node: Node, _ path: inout [String], _ result: inout [[String]], _ toDelete: Set<ObjectIdentifier>) {
        // Skip if current node is marked for deletion
        if toDelete.contains(ObjectIdentifier(node)) {
            return
        }

        // Add current path to result if it's not empty
        if !path.isEmpty {
            result.append(path)
        }

        // Recursively process all children
        for (folder, child) in node.children {
            path.append(folder) // Add folder to current path
            collectPaths(child, &path, &result, toDelete)
            path.removeLast() // Backtrack
        }
    }
}

/*
 Time Complexity:
 1. Tree Construction:
    - O(N * L) where N is the number of paths and L is the average path length
    - Each path is processed once, and each folder in the path is visited once

 2. Serialization & Counting:

    - O(M) where M is the total number of nodes in the tree
    - Each node is visited exactly once during serialization
    - String concatenation operations are O(1) amortized for joined()

 3. Marking Duplicates:

    - O(M) same as serialization
    - Performs the same tree traversal again

 4. Path Collection:
    - O(M) visits each non-deleted node once

 Total Time Complexity: O(N*L + M)
 */

/*
 Space Complexity:
 1. Tree Storage:
    - O(M) where M is total nodes (each node stores a children dictionary)

 2. Serialization Storage:
    - O(M) for the serialCount dictionary
    - Each serial string could be up to O(M) size in worst case (deeply nested tree)

 3. Deletion Markers:
    - O(D) where D is number of duplicate subtrees (stored in toDelete set)

 4. Recursion Stack:
    - O(H) where H is maximum tree depth

 Total Space Complexity: O(M + D + H)
 */
