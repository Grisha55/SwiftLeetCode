class Solution {
  func arithmeticTriplets(_ nums: [Int], _ diff: Int) -> Int {
    var count = 0
    let n = nums.count
    
    for i in 0..<n {
      for j in i + 1..<n {
        if nums[j] - nums[i] == diff {
          for k in j + 1..<n {
            if nums[k] - nums[j] == diff {
              count += 1
            }
          }
        }
      }
    }
    
    return count
  }
}