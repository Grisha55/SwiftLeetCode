//
// 0350. Intersection of Two Arrays II
// Problem: https://leetcode.com/problems/intersection-of-two-arrays-ii/
// SwiftLeetCode
//

import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        // Sort both arrays. It will help to compare elements of both arrays efficiently.
        let a = nums1.sorted()
        let b = nums2.sorted()

        // Using two pointers to traverse through a and b
        var i = 0
        var j = 0

        // Result array
        var result: [Int] = []

        // Compare the elements at the current positions of both pointers.
        while i < a.count && j < b.count {

            // If the element in nums1 is less than the element in nums2, increment pointer i.
            if a[i] < b[j] {
                i += 1
            
            // If the element in nums1 is greater than the element in nums2, increment pointer j.
            } else if a[i] > b[j] {
                j += 1

            // If the elements are equal, it means we have found a common element.
            } else {
                result.append(a[i])
                i += 1
                j += 1
            }
        }
        return result
    }
}
