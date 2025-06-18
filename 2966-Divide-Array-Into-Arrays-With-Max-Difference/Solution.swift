//
// 2966. Divide Array Into Arrays With Max Difference
// SwiftLeetCode
//

import Foundation

class Solution {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        var nums = nums.sorted() // Sort the array in ascending order
        var result: [[Int]] = []
        let m = nums.count

        // Going through the array in step 3
        for i in stride(from: 0, to: m, by: 3) {

            // Check that there are enough 3 elements at the end of the array
            if i + 2 >= m {
                return []
            }

            let group = [nums[i], nums[i + 1], nums[i + 2]]

            // Check the difference between max and min in the group
            if group[2] - group[0] > k {
                return []
            }

            result.append(group)
        }

        return result
    }
}
