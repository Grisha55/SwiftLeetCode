class Solution {
    func peopleAwareOfSecret(_ n: Int, _ delay: Int, _ forget: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: 0, count: n + 1)
        var prefixSum = Array(repeating: 0, count: n + 1)

        // dp[i] - number of people that knew a secret at first day
        dp[1] = 1 
        prefixSum[1] = 1

        for day in 2...n {
            // People whith can share a secret at current day
            let left = max(1, day - forget + 1)
            let right = max(0, day - delay)

            if right >= left {
                let share = (prefixSum[right] - (left > 1 ? prefixSum[left - 1] : 0) + mod) % mod

                dp[day] = share
            }

            prefixSum[day] = (prefixSum[day - 1] + dp[day]) % mod
        }

        // Sum all who knew a secret at day n
        let left = max(1, n - forget + 1)
        let result = (prefixSum[n] - (left > 1 ? prefixSum[left - 1] : 0) + mod) % mod

        return result
    }
}