class Solution {
  func minPairSum(_nums: [Int]) -> Int {
    let sortedNums = nums.sorted()
    var left = 0
    var right = sortedNums.count - 1
    var maxSum = 0

    while left < right {
      sum = max(sum, sortedNums[left] + sortedNums[right])
      left += 1
      right -= 1
    }

    return maxSum
  }
}