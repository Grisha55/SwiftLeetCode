//
// 1900. The Earliest and Latest Rounds Where Players Compete
// SwiftLeetCode
//

class Solution {
    func earliestAndLatest(_ n: Int, _ firstPlayer: Int, _ secondPlayer: Int) -> [Int] {
        var left = min(firstPlayer, secondPlayer)
        var right = max(firstPlayer, secondPlayer)
        
        // If players are already paired in the first round
        if left + right == n + 1 {
            return [1, 1]
        }
        
        // Base cases for small tournaments
        if n == 3 || n == 4 {
            return [2, 2]
        }
        
        // Mirror the positions if left is farther from start than right is from end
        if left - 1 > n - right {
            let temp = n + 1 - left
            left = n + 1 - right
            right = temp
        }
        
        let nextRound = (n + 1) / 2
        var minRound = n
        var maxRound = 1
        
        if right * 2 <= n + 1 {
            // Case when both players are in the first half
            let preLeft = left - 1
            let midGap = right - left - 1
            
            for i in 0...preLeft {
                for j in 0...midGap {
                    let res = earliestAndLatest(nextRound, i + 1, i + j + 2)
                    minRound = min(minRound, 1 + res[0])
                    maxRound = max(maxRound, 1 + res[1])
                }
            }
        } else {
            // Case when players span the middle
            let mirrored = n + 1 - right
            let preLeft = left - 1
            let midGap = mirrored - left - 1
            let innerGap = right - mirrored - 1
            
            for i in 0...preLeft {
                for j in 0...midGap {
                    let res = earliestAndLatest(nextRound, i + 1, i + j + 1 + (innerGap + 1) / 2 + 1)
                    minRound = min(minRound, 1 + res[0])
                    maxRound = max(maxRound, 1 + res[1])
                }
            }
        }
        
        return [minRound, maxRound]
    }
}

/*
 # Explanation of Earliest and Latest Rounds Solution

 ## Problem Overview
 This solution determines when two specific players will face each other in a single-elimination tournament where:
 - Players are initially ordered from 1 to n
 - In each round, players compete against their mirror position (1st vs last, 2nd vs 2nd-last, etc.)
 - The better players always win until they meet each other
 - We need to find both the earliest and latest possible round they could meet

 ## Key Concepts

 ### Tournament Structure
 1. **Initial Setup**: Players are lined up in order 1 through n
 2. **Pairing Mechanism**:
    - Each round pairs i-th player from start with i-th player from end
    - Middle player gets a bye if odd number of players remain
 3. **Winners Advancement**: Winners maintain their original relative ordering

 ### Solution Approach
 1. **Base Cases Handling**:
    - Immediate return if players are already paired in first round
    - Special handling for small tournaments (3-4 players)

 2. **Position Normalization**:
    - Mirror positions when one player is closer to an end than the other
    - Simplifies subsequent calculations

 3. **Recursive Calculation**:
    - **First Half Scenario**: Both players in first half of bracket
    - **Cross-Middle Scenario**: Players on opposite sides of middle
    - Evaluates all possible match outcomes that could delay or accelerate their meeting

 ## Algorithm Details

 ### For Earliest Round
 1. Players meet as soon as they become mirror positions
 2. Progressively halves the tournament size each round
 3. Tracks when they first become paired

 ### For Latest Round
 1. Maximizes the distance between players each round
 2. Positions them at opposite ends of the bracket when possible
 3. Continues until they must face each other

 ## Complexity Analysis
 - **Time**: O(log n) best case, but potentially higher due to recursive branching
 - **Space**: O(log n) for recursion stack depth

 ## Edge Cases Handled
 - Immediate first-round matches
 - Small tournaments (n ≤ 4)
 - Players initially near tournament boundaries
 - Odd/even player counts

 This approach efficiently explores the tournament structure while accounting for all possible match outcome variations that affect when the two players meet.
 */
