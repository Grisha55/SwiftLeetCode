class Solution {
  func productQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
    var powers = [Int]()
    var result = [Int]()
    var currentPower = 1
    var mod = 1_000_000_007
    var i = 0

    // Step 1: Find all powers of 2 that are less than or equal to n
    while currentPower <= n {
      if n & currentPower != 0 {
        powers.append(currentPower)
      }
      currentPower <<= 1 // Move to the next power of 2
    }

    // Step 2: Calculate the product of powers for each query
    for query in queries {
      var product = 1

      // Step 3: Calculate the product of the specified powers
      for j in query[0]..<query[1] + 1 {
        product = (product * powers[j]) % mod
      }

      // Step 4: Store the result for the current query
      result.append(product)
    }

    // Step 5: Return the results for all queries
    return result
  }
}