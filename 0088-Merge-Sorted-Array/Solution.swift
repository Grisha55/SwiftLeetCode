//
// 0088. Merge Sorted Array
// Problem: https://leetcode.com/problems/merge-sorted-array/
// SwiftLeetCode
//

import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1        // Last index of element in nums1
        var j = n - 1        // Last index of element in nums2
        var k = m + n - 1    // Last index in nums1 (where we'll push)
        
        // While nums1 and nums2 isn't empty
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
        
        // If there's elements in nums2, copy them into nums1
        while j >= 0 {
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }
    }
    
}
