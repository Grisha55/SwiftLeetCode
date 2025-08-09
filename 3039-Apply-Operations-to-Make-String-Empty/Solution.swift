class Solution {
  func lastNonEmptyString(_ s: String) -> String {
    // Step 1: Count the frequency of each character in the string
    var freq = [Character: Int]()
    for c in s {
      freq[c, default: 0] += 1
    }

    // Step 2: For each character, record how many rounds it will take to be removed (equal to its frequency)
    var charRounds = [Character: Int]()
    for (c, v) in freq {
      charRounds[c] = v
    }

    // Step 3: Find the maximum number of rounds among all characters
    let maxRound = charRounds.values.max() ?? 0

    // Step 4: Track how many times we've seen each character so far
    var roundCount = [Character: Int]()
    var result = ""

    // Step 5: Iterate through the string
    // If a character is being removed in the last round, add it to the result
    for c in s {
      roundCount[c, default: 0] += 1
      // Only add the character if it's being removed in the last round
      if roundCount[c] == charRounds[c], charRounds[c] == maxRound {
        result.append(c)
      }
    }

    // Step 6: Return the result string
    return result
  }
}