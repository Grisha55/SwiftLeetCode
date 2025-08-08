class Solution {
  func minimumRounds(_ tasks: [Int]) -> Int {
    var taskCount = [Int: Int]()

    // Count the occurrences of each task
    for task in tasks {
      taskCount[task, default: 0] += 1
    }

    var totalRounds = 0

    // Calculate the minimum rounds needed for each task
    for count in taskCount.values {
      if count == 1 {
        // If there's only one task, it's impossible to complete it in rounds of 2 or 3
        return -1
      } else if count % 3 == 0 {
        // If the count is divisible by 3, we can complete it in count / 3 rounds
        totalRounds += count / 3
      } else {
        // If the count is not divisible by 3, we can complete it in (count / 3) + 1 rounds
        totalRounds += (count / 3) + 1
      }
    }

    return totalRounds
  }
}