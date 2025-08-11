class Solution {
  func maxArea(_ height: [Int]) -> Int {
    var l = 0
    var r = height.count - 1
    var maximum = 0

    while l < r {
      let length = r - l
      let minH = min(height[l], height[r])
      let space = length * minH

      maximum = max(maximum, space)

      if height[l] < height[r] {
        l += 1
      } else {
        r -= 1
      }
    }

    return maximum
  }
}