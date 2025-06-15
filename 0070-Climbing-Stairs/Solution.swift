//
//  0070. Climbing Stairs
//  Problem: https://leetcode.com/problems/climbing-stairs/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var steps: [Int] = [1, 1]
        if n == 1 { return 1 }
        for i in 2...n {
            steps.append(steps[i - 1] + steps[i - 2])
        }
        
        return steps[n]
    }
}
