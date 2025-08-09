class Solution {
  func minimumOperationsToMakeKPeriodic(_ word: String, _ k: Int) -> Int {
    let n = word.count
    let wordArray = Array(word)
    var substringFrequency = [String: Int]()
    var maxFrequency = 0

    // Iterate through the string in steps of k to count the frequency of each k-length substring
    for i in stride(from: 0, to: n, by: k) {
      // Ensure we don't go out of bounds
      guard i + k <= n else { continue }
      let substring = String(wordArray[i..<i + k])
      // Count the frequency of the substring
      substringFrequency[substring, default: 0] += 1
      maxFrequency = max(maxFrequency, substringFrequency[substring]!)
    }
    // The number of operations needed is the total number of k-length substrings minus the maximum frequency of any substring
    // This is because we can keep the most frequent subsrtring and change the others to it
    let m = n / k

    return m - maxFrequency
  }
}