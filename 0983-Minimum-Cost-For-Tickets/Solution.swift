//
// 0983. Minimum Cost For Tickets
// Problem: https://leetcode.com/problems/minimum-cost-for-tickets/
// SwiftLeetCode
//

import Foundation

class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let travelDays = Set(days)  // Convert the travel days array to a set for fast lookup
        var dp = [Int](repeating: 0, count: 366)  // Create dp array for days 1 through 365

        for i in 1...365 {  // Loop through each day of the year
            if !travelDays.contains(i) {
                dp[i] = dp[i-1]  // If not a travel day, cost remains the same as previous day
            } else {
                let oneDay = dp[i - 1] + costs[0]  // Cost if buying a 1-day ticket
                let sevenDays = dp[max(0, i - 7)] + costs[1]  // Cost if buying a 7-day ticket
                let thirtyDays = dp[max(0, i - 30)] + costs[2]  // Cost if buying a 30-day ticket
                dp[i] = min(oneDay, sevenDays, thirtyDays)  // Choose the minimum of the three
            }
        }
        return dp[365]  // The minimum cost to cover all travel days
    }
}

/*
🧠 Problem statement (in simple terms):
You are given:
    - array days — days you will be traveling;
    - array costs — ticket prices:
        - costs[0]: ticket for 1 day;
        - costs[1]: ticket for 7 days;
        - costs[2]: ticket for 30 days.

You need to choose tickets to cover all days from the days array and spend as little money as possible.


🔍 Solution idea:
We use dynamic programming:
    - dp[i] — minimum ticket cost up to and including day i.
    - We go from 1 to 365 (since days are dates in a year).
    - If day i is not included in days, then the cost is the same as in i-1.
    - If it is included, we compare 3 options:
        - buy a ticket for 1 day;
        - buy a ticket for 7 days;
        - buy a ticket for 30 days;
    - We take the minimum of these three options.


✅ Example:

let days = [1, 4, 6, 7, 8, 20]
let costs = [2, 7, 15]

Here it is profitable:
    - buy a 7-day ticket for day 6 (covers 6, 7, 8);
    - buy a 1-day ticket for day 1 and for day 4;
    - buy a 1-day ticket for 20.

Minimum cost: 2 (for 1) + 2 (for 4) + 7 (for 6–8) + 2 (for 20) = 13.

📊 Complexity:
Time: O(365) — we go through a maximum of 365 days.

Memory: O(365) — dp array.
*/
