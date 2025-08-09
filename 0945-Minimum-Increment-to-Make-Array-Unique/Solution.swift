class Solution {
  func minIncrementForUnique(_ nums: [Int]) -> Int {
    var sortedNums = nums.sorted()
    var moves = 0
    var nextUnique = 0

    for num in sortedNums {
      if num < nextUnique {
        // If the current number is less than the next unique number, we need to increment it
        moves += nextUnique - num
        nextUnique += 1
      } else {
        // If the current number is greater than or equal to the next unique number,
        // we can set the next unique number to be one more than the current number.
        nextUnique = num + 1
      }
    }

    return moves
  }
}