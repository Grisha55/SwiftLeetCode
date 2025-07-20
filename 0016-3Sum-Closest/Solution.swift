//
// 0016. 3Sum Closest
// Task: https://leetcode.com/problems/3sum-closest/description/
// SwiftLeetCode
//

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        // Sort the input array for using two pointer method more effectively
        let nums = nums.sorted()
        var minSum = nums[0] + nums[1] + nums[2]

        for i in 0..<nums.count - 2 {
            var left = i + 1
            var right = nums.count - 1

            while left < right {
                // nums[i] is a first number in sum
                let currentSum = nums[i] + nums[left] + nums[right]

                if currentSum == target {
                    return currentSum
                } else if abs(currentSum - target) < abs(minSum - target) {
                    minSum = currentSum
                } else if currentSum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
        return minSum
    }
}

/*
Time Complexity - O(n^2)
Space Complexity - O(1)
*/
