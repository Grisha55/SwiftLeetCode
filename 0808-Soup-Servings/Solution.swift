//
// 0808. Soup Servings
// SwiftLeetCode
//

class Solution {
  func soupServings(_ n: Int) -> Double {
    // Since the probability becomes stable when n is large, we can return 1 for n >= 5000
    if n >= 5000 {
      return 1.0
    }

    // Memoization dictionary to store coputed probabilities
    var memo = [String: Double]()

    // Convert n to a multiple of 25 to reduce state space
    let m = (n + 24) / 25

    func dp(_ a: Int, _ b: Int) -> Double {
      if a <= 0 && b <= 0 {
        return 0.5 // Both empty at same time
      }
      if a <= 0 {
        return 1.0 // A is empty first
      }
      if b <= 0 {
        return 0.0 // B is empty first
      }

      let key = "\(a), \(b)"
      if let prob = memo[key] {
        return prob
      }

      // Calculate probability for all 4 operations
      let prob = 0.25 * (dp(a - 4, b) +      // 100ml from A (4 * 25)
                         dp(a - 3, b - 1) +  // 75ml from A, 25ml from B
                         dp(a - 2, b - 2) +  // 50ml from each
                         dp(a - 1, b - 3))   // 25ml from A, 75ml from B

      memo[key] = prob
      return prob
    }

    return dp(m, m)
  }
}