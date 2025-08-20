class Solution {
  func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let sortedNums1 = nums1.sorted()
    let indexedNums2 = nums2.enumerated().sorted { $0.element < $1.element }
    var result = Array(repeating: 0, count: nums1.count)
    var left = 0
    var right = nums1.count - 1
    for (originalIndex, num2) in indexedNums2.reversed() {
      if sortedNums1[right] > num2 {
        result[originalIndex] = sortedNums1[right]
        right -= 1
      } else {
        result[originalIndex] = sortedNums1[left]
        left += 1
      }
    }
    return result
  }
}