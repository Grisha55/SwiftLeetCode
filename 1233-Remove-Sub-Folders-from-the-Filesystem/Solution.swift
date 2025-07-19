//
// 1233. Remove Sub-Folders from the Filesystem
// SwiftLeetCode
//

class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        let sortedFolders = folder.sorted()
        var ans: [String] = []
        var parent = ""

        for path in sortedFolders {
            if parent.isEmpty || !path.hasPrefix(parent + "/") {
                ans.append(path)
                parent = path
            }
        }

        return ans
    }
}

/*
Time Complexity - O(n log n)
Space Complexity - O(n)
 
 Explanation
 1. Sorting: The folders are sorted to ensure parent folders come before their potential sub-folders.
 2. Checking Sub-folders: For each folder, we check if it starts with the last added parent folder followed by "/". If not, it's added to the result, and it becomes the new parent.
 3. Edge Cases: The check parent.isEmpty ensures that the first folder is always added to the result.
*/
