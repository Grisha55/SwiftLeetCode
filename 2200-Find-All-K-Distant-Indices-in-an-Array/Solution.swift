//
// 2200. Find All K-Distant Indices in an Array
// Problem: https://leetcode.com/problems/find-all-k-distant-indices-in-an-array/description/?envType=daily-question&envId=2025-06-24
// SwiftLeetCode
//

import Foundation

class Solution {
    func findKDistantIndices(_ nums: [Int], _ key: Int, _ k: Int) -> [Int] {
        // Find indexes where value is equal to key
        let keyIndices = nums.indices.filter { nums[$0] == key }

        // Create a set to store k-distant indices. The set guarantees uniqueness and automatic sorting.
        var kDistantIndices: Set<Int> = []

        // Loop through each index where the value is equal to key
        for keyIndex in keyIndices {
            // We go through all the indices of the nums array
            for i in nums.indices {
                // Check if i is at most k distance from keyIndex
                if abs(i - keyIndex) <= k {
                    kDistantIndices.insert(i) // Add index i to the set
                }
            }
        }

        // Convert the set to a sorted array
        return Array(kDistantIndices).sorted()
    }
}

/*
Code explanation:

1. `keyIndices`: First we find all indices where the value of the element of the array `nums` is equal to `key`. To do this, we use `filter` on the array of indices.

2. `kDistantIndices`: We use `Set` to store k-distant indices. `Set` automatically guarantees uniqueness of elements and when converted to an array, the elements will be sorted.

3. Nested loops: Nested loops iterate over all indices `i` in `nums`. The inner loop checks if index `i` is within `k` distance from any of the `keyIndices`. The distance is calculated using `abs(i - keyIndex)`.

4. `insert(i)`: If index `i` is within the required distance, it is added to the set `kDistantIndices`.

5. `Array(kDistantIndices).sorted()`: Finally, the set is converted to a sorted array using `sorted()`.

This code is efficient because it uses the set to automatically sort and remove duplicates. The time complexity is approximately O(n*m), where n is the length of `nums` and m is the number of elements equal to `key`. In the worst case (when all elements are equal to `key`), the complexity is O(n^2). The space complexity is O(n) in the worst case (due to the set). To improve performance for large arrays, one can optimize the search for k-distant indices, for example by using more complex data structures or algorithms.
*/
