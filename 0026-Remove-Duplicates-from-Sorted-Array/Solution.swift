//
// 0026. Remove Duplicates from Sorted Array
// Problem: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
// SwiftLeetCode
//

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 0
    var j = 1
    
    while j < nums.count {
        if nums[j] != nums[i] {
            i += 1
            nums[i] = nums[j]
        }
        j += 1
    }
    return i + 1
}
