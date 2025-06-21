//
// 1011. Capacity To Ship Packages Within D Days
// Problem: https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/
// SwiftLeetCode
//

import Foundation

class Solution {

    func isValid(_ capacity: Int, _ weights: [Int], _ days: Int) -> Bool {
        var currentWeight = 0  // Current total weight loaded for a single day
        var neededDays = 1     // Start with 1 day

        for weight in weights {
            // If adding the current box exceeds capacity, we need a new day
            if currentWeight + weight > capacity {
                neededDays += 1
                currentWeight = 0  // Start new day's load
            }
            currentWeight += weight  // Add box to current day's load
        }
    
        return neededDays <= days  // Return true if we can ship within allowed days
    }


    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var left = weights.max()!  // The lowest possible capacity (must carry the heaviest box)
        var right = weights.reduce(0, +)  // The highest possible capacity (carry all at once)

        while left + 1 != right {
            let mid = (left + right) / 2  // Try the middle capacity
            if isValid(mid, weights, days) {
                right = mid  // Try to find a smaller valid capacity
            } else {
                left = mid  // Increase capacity if current one is not enough
            }
        }
    
        // Final check: return the smallest capacity that works
        return isValid(left, weights, days) ? left : right
    }

}

/*
🧠 Problem statement (in simple terms):
You are given a list of box weights and a number of days. You need to determine the minimum carrying capacity of a ship to transport all the boxes in a given number of days, where:
    - the boxes must be transported in the order they are given (the order cannot be changed);
    - you can send several boxes per day until the total weight exceeds the carrying capacity;
    - then you need to wait for the next day.


🧩 Solution idea:
We use binary search for the answer:
    1. The minimum possible carrying capacity is the maximum weight of one box.
    2. The maximum possible is the sum of all the weights (if everything is in 1 day).
    3. We use binary search: we are looking for the smallest possible carrying capacity at which everything can be transported in days days.
    4. The isValid function checks whether a ship with a given cargo capacity can complete the mission in the required number of days.


🔍 Example:
let weights = [1,2,3,4,5,6,7,8,9,10]
let days = 5
The solution is to find the smallest weight capacity that will allow us to ship all the boxes in 5 days. The answer is 15.

📊 Complexity:
Time: O(n * log(sum(weights))), where n is the number of boxes. For each binary search iteration (log), we go through all the boxes.

Memory: O(1) — no additional memory is used except for variables.
*/
