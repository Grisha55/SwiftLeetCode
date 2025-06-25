//
// 2040. Kth Smallest Product of Two Sorted Arrays
// SwiftLeetCode
//

import Foundation

class Solution {
    func kthSmallestProduct(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        let A = nums1
        let B = nums2
        
        // Binary search bounds: min and max possible product
        var left = -1_000_000_000_000_000_000
        var right = 1_000_000_000_000_000_000
        
        // Function to count number of pairs with product <= mid
        func countLessOrEqual(_ mid: Int) -> Int {
            var count = 0
            for a in A {
                if a == 0 {
                    // If a == 0, product is 0, so all b <= mid if mid >= 0
                    if mid >= 0 {
                        count += B.count
                    }
                } else if a > 0 {
                    // Count number of b where a * b <= mid => b <= mid / a
                    var l = 0, r = B.count
                    while l < r {
                        let m = (l + r) / 2
                        if a * B[m] <= mid {
                            l = m + 1
                        } else {
                            r = m
                        }
                    }
                    count += l
                } else {
                    // a < 0: count b where a * b <= mid => b >= ceil(mid / a)
                    var l = 0, r = B.count
                    while l < r {
                        let m = (l + r) / 2
                        if a * B[m] <= mid {
                            r = m
                        } else {
                            l = m + 1
                        }
                    }
                    count += B.count - l
                }
            }
            return count
        }
        
        // Binary search to find the kth smallest product
        while left < right {
            let mid = left + (right - left) / 2
            if countLessOrEqual(mid) >= k {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
    
}

