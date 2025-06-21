//
//
// Problem:
// SwiftLeetCode
//

import Foundation

class Solution {
    func differenceOfSums(_ n: Int, _ m: Int) -> Int {
        var sumN = 0
        var sumM = 0

        for i in 1...n {
            if i % m != 0 {
                sumN += i
            } else {
                sumM += i
            }
        }

        return sumN - sumM
    }
}
