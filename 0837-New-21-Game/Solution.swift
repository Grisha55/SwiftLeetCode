class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        if k == 0 || n >= k + maxPts { return 1.0 }
        var gameCount = 1.0
        var result = 0.0

        var dp = [Double](repeating: 0.0, count: n + 1)
        dp[0] = 1.0 // Base case: 0 points is always achievable
        
        for i in 1...n {
            dp[i] = gameCount / Double(maxPts)

            if i < k {
                gameCount += dp[i]
            } else {
                result += dp[i]
            }

            if i - maxPts >= 0 {
                gameCount -= dp[i - maxPts]
            }
        }

        return result
    }
}