class Solution {
  func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
    // Make a queue for students and a stack for sandwiches
    var queue = students
    var stack = sandwiches
    // This counts how many students have been rotated without eating
    var count = 0
    // Keep going while there are students and we haven't rotated everyone without a match
    while !queue.isEmpty && count < queue.count {
      // If the first student can eat the first sandwich
      if queue[0] == stack[0] {
        // Remove both from the front
        queue.removeFirst()
        stack.removeFirst()
        // Reset the count since someone ate
        count = 0
      } else {
        // Move the student to the end of the queue
        queue.append(queue.removeFirst())
        // Increase the count since no one ate
        count += 1
      }
    }
    // The number of students left can't eat
    return queue.count
  }
}