class Solution {
    func distinctAverages(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var left = 0
        var right = nums.count - 1
        var averages = Set<Double>()

        while left < right {
            let average = Double(nums[left] + nums[right]) / 2.0
            averages.insert(average)
            left += 1
            right -= 1
        }

        return averages.count
    }
}