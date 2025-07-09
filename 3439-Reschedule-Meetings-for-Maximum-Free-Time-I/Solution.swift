//
// 3439. Reschedule Meetings for Maximum Free Time I
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxFreeTime(_ eventTime: Int, _ k: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
        let n = startTime.count
        var res = 0  // This will store our maximum free time result
        var t = 0    // This tracks the total duration of the current window of meetings
        
        for i in 0..<n {
            // Add current meeting's duration to our running total
            t += endTime[i] - startTime[i]
            
            // Calculate left boundary:
            // If we're in the first k meetings, left boundary is 0 (start of event)
            // Otherwise, it's the end time of the meeting k positions back
            let left = i <= k - 1 ? 0 : endTime[i - k]
            
            // Calculate right boundary:
            // If this is the last meeting, right boundary is eventTime
            // Otherwise, it's the start time of the next meeting
            let right = i == n - 1 ? eventTime : startTime[i + 1]
            
            // Calculate potential free time between left and right boundaries,
            // minus the duration of meetings in our current window
            res = max(res, right - left - t)
            
            // If we've processed at least k meetings, remove the oldest meeting
            // from our window to maintain window size of at most k
            if i >= k - 1 {
                t -= endTime[i - k + 1] - startTime[i - k + 1]
            }
        }
        
        return res
    }
}
