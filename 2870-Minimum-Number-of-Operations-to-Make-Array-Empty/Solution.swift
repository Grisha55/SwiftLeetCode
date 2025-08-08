class Solution {
  func minOperations(_ nums: [Int]) -> Int {
    var countDict = [Int: Int]()

    // Count the occurrences of each number
    for num in nums {
      countDict[num, default: 0] += 1
    }

    var operations = 0

    // Calculate the minimum operations needed for each number
    for count in countDict.values {
      if count == 1 {
        // If there's only one occurrence, it's impossible to remove it
        return -1
      } else if count % 3 == 0 {
        // If the count is divisible by 3, we can remove it in count / 3 operations
        operations += count / 3 
      } else {
        // If the count is not divisible by 3, we can remove it in (count / 3) + 1 operations
        operations += (count / 3) + 1
      }
    }

    return operations
  }
}