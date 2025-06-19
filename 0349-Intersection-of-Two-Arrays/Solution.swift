//
// 0349. Intersection of Two Arrays
// Problem: https://leetcode.com/problems/intersection-of-two-arrays/
// SwiftLeetCode
//

import Foundation

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        // Initialize an empty array to store the final result.
        var resultArr: [Int] = []
        // Initialize an empty set to efficiently track unique elements found in both arrays. Sets provide O(1) lookup.
        var resultSet: Set<Int> = []
        // Initialize an empty dictionary to count the occurrences of each element in nums1.
        var dict: [Int:Int] = [:]

        // Count the occurrences of each element in nums1 using a dictionary.
        for num in nums1 {
            dict[num, default: 0] += 1 // Add 1 to the count for 'num'; if 'num' is not in 'dict', default to 0 before adding 1.
        }

        // Iterate through nums2 and check if each element is present in nums1 (using the dictionary).
        for num in nums2 {
            if dict[num, default: 0] > 0 { // If 'num' exists in 'dict' and its count is > 0...
                resultSet.insert(num) // ...add it to the 'resultSet'. This ensures uniqueness.
            }
        }

        // Convert the set to an array for the return value.
        resultSet.forEach { resultArr.append($0) }

        // Return the array containing the intersection.
        return resultArr
    }
}

/*
Explanation in simple terms:

1. Counting Occurrences: The function first creates a dictionary (`dict`) to store the frequency of each number in `nums1`. This allows for quick checking of whether a number from `nums2` is present in `nums1`.

2. Checking for Intersection: It then iterates through `nums2`. For each number in `nums2`, it checks if that number exists as a key in `dict`. If it does, and its count is greater than 0, it means the number is present in both arrays. This number is added to a `resultSet` (a set, which automatically handles uniqueness).

3. Returning the Result: Finally, the `resultSet` (which contains only unique intersection elements) is converted into an array (`resultArr`) and returned.

The use of a dictionary and a set makes this algorithm efficient. The time complexity is approximately O(m + n), where m and n are the lengths of `nums1` and `nums2`, respectively. This is because dictionary lookups and set insertions are generally O(1) on average. The space complexity is O(m) in the worst case, because the dictionary might need to store all elements of `nums1` if they are all unique.
*/
