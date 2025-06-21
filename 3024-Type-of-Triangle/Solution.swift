//
// 3024. Type of Triangle
// Problem: https://leetcode.com/problems/type-of-triangle/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func triangleType(_ nums: [Int]) -> String {
        let sortedNums = nums.sorted(by: <)
        if sortedNums[0] + sortedNums[1] <= sortedNums[2] { return "none" }
        let list = Set(sortedNums)
        switch list.count {
            case 1: return "equilateral"
            case 2: return "isosceles"
            case 3: return "scalene"
            default: return "ERROR!!!"
        }
    }
}
