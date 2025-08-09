class Solution {
  func reorganizeString(_ s: String) -> String {
    var frequency = [Character: Int]()
    
    // Count the frequency of each character
    for char in s {
      frequency[char, default: 0] += 1
    }
    
    // Sort characters by frequency in descending order
    let sortedChars = frequency.sorted { $0.value > $1.value }
    
    // Check if the most frequent character can be placed without adjacent duplicates
    if let maxFreq = sortedChars.first?.value, maxFreq > (s.count + 1) / 2 {
      return ""
    }
    
    var result = Array(repeating: " ", count: s.count)
    var index = 0
    
    // Place characters in the result array
    for (char, freq) in sortedChars {
      for _ in 0..<freq {
        if index >= s.count {
          index = 1 // Start filling odd indices after even indices are filled
        }
        result[index] = String(char)
        index += 2
      }
    }

    return result.joined()
  }
}