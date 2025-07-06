//
// 1865. Finding Pairs With a Certain Sum
// SwiftLeetCode
//

import Foundation

class FindSumPairs {
    private var nums1: [Int]
    private var nums2: [Int]
    private var countDict: [Int: Int] // Dictionary for count frequences in nums2
    
    init(_ nums1: [Int], _ nums2: [Int]) {
        self.nums1 = nums1
        self.nums2 = nums2
        self.countDict = [:]
        
        // Count frequencies in nums2
        for num in nums2 {
            countDict[num] = (countDict[num] ?? 0) + 1
        }
    }
    
    func add(_ index: Int, _ val: Int) {
        // Check if index is valid
        guard index >= 0 && index < nums2.count else { return }
        
        // Update countDict
        let oldValue = nums2[index]
        countDict[oldValue] = (countDict[oldValue] ?? 0) - 1
        
        nums2[index] += val
        
        let newValue = nums2[index]
        countDict[newValue] = (countDict[newValue] ?? 0) + 1
    }
    
    func count(_ tot: Int) -> Int {
        var result = 0
        
        for num in nums1 {
            let rest = tot - num
            result += countDict[rest] ?? 0
        }
        
        return result
    }
}

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * let obj = FindSumPairs(nums1, nums2)
 * obj.add(index, val)
 * let ret_2: Int = obj.count(tot)
 */
