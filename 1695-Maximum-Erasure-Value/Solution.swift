//
// 1695. Maximum Erasure Value
// SwiftLeetCode
//

class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var elements = Set<Int>()
        var maxSum = 0
        var currSum = 0
        var left = 0

        for right in 0..<nums.count {
            while elements.contains(nums[right]) {
                elements.remove(nums[left])
                currSum -= nums[left]
                left += 1
            }
            elements.insert(nums[right])
            currSum += nums[right]
            maxSum = max(maxSum, currSum)
        }

        return maxSum
    }
}

/*
Time Complexity - O(n)
Space Complexity - O(n)
*/
