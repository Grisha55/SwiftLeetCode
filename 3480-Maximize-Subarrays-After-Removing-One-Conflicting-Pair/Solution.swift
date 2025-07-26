//
// 3480. Maximize Subarrays After Removing One Conflicting Pair
// SwiftLeetCode
//

class Solution {
    func maxSubarrays(_ n: Int, _ conflictingPairs: [[Int]]) -> Int {
        // Arrays to store the two smallest conflicting 'b' values for each 'a'
        var bMin1 = Array(repeating: Int.max, count: n + 1)
        var bMin2 = Array(repeating: Int.max, count: n + 1)
        
        // Process each conflicting pair to populate bMin1 and bMin2
        for pair in conflictingPairs {
            let a = min(pair[0], pair[1])
            let b = max(pair[0], pair[1])
            
            // Update the smallest and second smallest conflicting 'b' for 'a'
            if bMin1[a] > b {
                bMin2[a] = bMin1[a]
                bMin1[a] = b
            } else if bMin2[a] > b {
                bMin2[a] = b
            }
        }
        
        var res = 0
        var ib1 = n  // Index tracking the current minimum b
        var b2 = Int.max  // Tracks the second minimum b overall
        var delCount = Array(repeating: 0, count: n + 1)
        
        // Process from right to left
        for i in stride(from: n, through: 1, by: -1) {
            // Update the current minimum b index
            if bMin1[ib1] > bMin1[i] {
                b2 = min(b2, bMin1[ib1])
                ib1 = i
            } else {
                b2 = min(b2, bMin1[i])
            }
            
            // Calculate valid subarrays ending at current position
            res += min(bMin1[ib1], n + 1) - i
            
            // Calculate the count of subarrays that would become valid if we remove this conflict
            delCount[ib1] += min(min(b2, bMin2[ib1]), n + 1) - min(bMin1[ib1], n + 1)
        }
        
        // The result is the base count plus the maximum improvement from removing one conflict
        return res + delCount.max()!
    }
}

/*
Time Complexity - O(n)
Space Complexity - O(n)
*/
