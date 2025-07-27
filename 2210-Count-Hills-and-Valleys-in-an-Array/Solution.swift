//
// 2210. Count Hills and Valleys in an Array
// SwiftLeetCode
//

class Solution {
    func countHillValley(_ nums: [Int]) -> Int {
        var count = 0
        var n = nums.count

        // First, remove consecutive duplicates to handle pateaus
        var filteredNums = [nums[0]]
        for i in 1..<n {
            if nums[i] != nums[i - 1] {
                filteredNums.append(nums[i])
            }
        }

        n = filteredNums.count
        if n < 3 {
            return 0
        }

        for i in 1..<n-1 {
            let left = filteredNums[i - 1]
            let current = filteredNums[i]
            let right = filteredNums[i + 1]

            if left < current && right < current { // It's a hill
                count += 1
            } else if left > current && right > current { // It's a valley
                count += 1
            }
        }

        return count
    }
}

/*
Time Complexity - O(n)
SpaceComplexity - O(n)
*/
