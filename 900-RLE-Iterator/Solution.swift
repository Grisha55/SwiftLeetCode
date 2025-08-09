class RLEIterator {
    // The encoding array is stored as a property of the class
    private var encoding: [Int]
    // The index to keep track of the current position in the encoding array
    private var index: Int
    
    init(_ encoding: [Int]) {
        self.encoding = encoding
        self.index = 0
    }
    
    func next(_ n: Int) -> Int {
      var remaining = n
        // Iterate through the encoding array until we find enough elements or run out of elements
        while index < encoding.count {
            // If the current count is greater than or equal to the remaining elements to exhaust
            // we can return the value at next index
            if encoding[index] >= remaining {
                encoding[index] -= remaining
                return encoding[index + 1]
            } else {
                // If the current count is less than the remaining elements to exhaust,
                // we exhaust all of them and move to the next pair in the encoding array
                remaining -= encoding[index]
                index += 2
            }
        }
        return -1
    }
}