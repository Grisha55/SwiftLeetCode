class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        var sortedTokens = tokens.sorted()
        var left = 0
        var right = sortedTokens.count - 1
        var score = 0
        var maxScore = 0
        var power = power

        while left <= right {
            if power >= sortedTokens[left] {
                power -= sortedTokens[left]
                score += 1
                maxScore = max(maxScore, score)
                left += 1
            } else if score > 0 {
                power += sortedTokens[right]
                score -= 1
                right -= 1
            } else {
                break
            }
        }

        return maxScore
    }
}