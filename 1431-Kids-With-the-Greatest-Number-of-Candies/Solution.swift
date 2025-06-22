//
// 1431. Kids With the Greatest Number of Candies
// Problem: https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/description/
// SwiftLeetCode
//

import Foundation

class Solution {
    func kidsWithCandies(_ candiesCountOfKids: [Int], _ extraCandies: Int) -> [Bool] {
        var max = 0
        for candiesCount in candiesCountOfKids {
            if candiesCount > max {
                max = candiesCount
            }
        
        }
        var result: [Bool] = []
         for candiesCount in candiesCountOfKids {
            if candiesCount + extraCandies >= max {
             result.append(true)
            } else {
                result.append(false)
            }
            
             
         }
        return result
    }
}
