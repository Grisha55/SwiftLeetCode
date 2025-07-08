//
//
// SwiftLeetCode
//

class Solution {
    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        // Sort events by their end day to process them in chronological order
        let sortedEvents = events.sorted { $0[1] < $1[1] }
        let n = sortedEvents.count

        // Create a dynamic programming table
        // dp[i][j] represents the maximum value we can get by attending up to j events from the first i events
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

        for i in 1...n {
            let currentEvent = sortedEvents[i - 1]
            let start = currentEvent[0]
            let end = currentEvent[1]
            let value = currentEvent[2]

            // Find the last event that doesn't overlap with the current event
            var lastNonOverlapping = 0
            var low = 1
            var high = i - 1

            // Binary search to find the rightmost event that ends before current starts
            while low <= high {
                let mid = (low + high) / 2
                if sortedEvents[mid - 1][1] < start {
                    lastNonOverlapping = mid
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }

            // Update DP table
            for j in 1...k {
                // We have two choices:
                // 1. Don't attend the current event - take value from dp[i-1][j]
                // 2. Attend the current event - take value from dp[lastNonOverlapping][j-1] + current value
                dp[i][j] = max(dp[i - 1][j], dp[lastNonOverlapping][j - 1] + value)
            }
        }

        // The answer will be the maximum value we can get by attending up to k events from all n events
        return dp[n][k]
    }
}

/*
Explanation

Problem Understanding

We need to select up to k non-overlapping events from a list to maximize the total value. Events cannot overlap in time (the next must start after the previous ends).

Approach

1. Sorting: First, we sort all events by their end day. This helps us process events in chronological order and makes it easier to find non-overlapping events.
2. Dynamic Programming Table: We create a 2D array dp where:
    - dp[i][j] represents the maximum value we can get by selecting up to j events from the first i events.
3. Binary Search: For each event, we use binary search to quickly find the last event that doesn't overlap with the current one. This helps us efficiently determine which previous events we can still consider when including the current event.
4. DP Table Update: For each event and each possible count of events we can attend (from 1 to k), we decide whether to:
    - Skip the current event (take the value from the previous count)
    - Include the current event (add its value to the best value we could get from non-overlapping events with one less available slot)

Time Complexity
    - Sorting: O(n log n)
    - Main loop: O(n k)
    - Binary search in each iteration: O(log n)
    - Total: O(n log n + n k log n) = O(n k log n)

Space Complexity
    - O(n k) for the DP table

Key Insights
- Sorting by end time allows us to efficiently find non-overlapping events
- Dynamic programming helps us build up the solution by considering each event and each possible count of events we can attend
- Binary search optimizes the process of finding compatible previous events

This solution efficiently explores all possible combinations of events while respecting the constraints, ensuring we find the maximum possible value.
*/
