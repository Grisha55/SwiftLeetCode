class Solution {
  func reorderedPowerOf2(_ n: Int) -> Bool {
    // Step 1: Convert the input number to a string and sort its digits
    // This helps us easily compare digit arrangements
    let digits = String(n).sorted()

    // Step 2: Start with the smallest power of 2 (1)
    var powerOfTwo = 1

    // Step 3: Check all powers of 2 up to 1,000,000,000
    // For each power of 2, sort its digits and compare with the input
    while powerOfTwo <= 1_000_000_000 {
      // If the sorted digits match, n can be reordered to a power of 2
      if String(powerOfTwo).sorted() == digits {
        return true
      }
      // Move to the next power of 2
      powerOfTwo *= 2
    }

    // Step 4: If no match is found, return false
    return false
  }
}