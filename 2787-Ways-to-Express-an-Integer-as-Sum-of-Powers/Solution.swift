class Solution {
  func numberOfWays(_ n: Int, _ x: Int) -> Int {
    let MOD = 1_000_000_007
    var dp = Array(repeating: 0, count: n + 1)
    dp[0] = 1 // There's one way to express 0 as a sum of powers (using no numbers)

    for i in 1...n {
      let power = Int(pow(Double(i), Double(x))) // Calculate i^x
      if power > n { break } // No need to consider powers greater than n

      // Update dp array for all sums that can include this power
      for j in stride(from: n, through: power, by: -1) {
        // For each j, add the number of ways to form j - power
        dp[j] = (dp[j] + dp[j - power]) % MOD
      }
    }

    return dp[n]
  }
}