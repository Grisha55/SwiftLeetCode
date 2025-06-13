// 0004-Median-Of-Two-Sorted-Arrays
// Problem: https://leetcode.com/problems/median-of-two-sorted-arrays/

import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    // Using links of given arrays without making copies
    let n1 = nums1.count <= nums2.count ? nums1 : nums2
    let n2 = nums1.count > nums2.count ? nums1 : nums2
    
    let count = n1.count + n2.count
    let mid = count / 2
    
    var l = 0
    var r = n1.count
    
    while true {
        let i = (l + r) / 2
        let j = mid - i
        
        // Boundary of n1 subarray
        let n1L = i > 0 ? n1[i - 1] : Int.min
        let n1R = i < n1.count ? n1[i] : Int.max
        
        // Boundary of n2 subarray
        let n2L = j > 0 ? n2[j - 1] : Int.min
        let n2R = j < n2.count ? n2[j] : Int.max
        
        if n1L <= n2R && n2L <= n1R {
            if count % 2 == 0 {
                return Double(max(n1L, n2L) + min(n1R, n2R)) / 2.0
            } else {
                return Double(min(n1R, n2R))
            }
        } else if n1L > n2R {
            r = i - 1
        } else {
            l = i + 1
        }
    }
}
