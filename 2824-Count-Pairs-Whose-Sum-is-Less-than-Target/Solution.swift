class Solution {
  func countPairs(_ nums: [Int], _ target: Int) -> Int {
    var count = 0

    for i in 0..<nums.count {
      var right = i + 1
      while right < nums.count {
        if nums[i] + nums[right] < target {
          count += 1
        }
        right += 1
      }
    }

    return count
  }
}