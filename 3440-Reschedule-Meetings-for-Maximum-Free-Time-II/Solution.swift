//
// 3440. Reschedule Meetings for Maximum Free Time II
// SwiftLeetCode
//

class Solution {
    func maxFreeTime(_ totalEventTime: Int, _ meetingStarts: [Int], _ meetingEnds: [Int]) -> Int {
        let meetingCount = meetingStarts.count
        if meetingCount == 0 { return totalEventTime }

        // Step 1: Calculate all free time gaps
        var freeGaps = [meetingStarts[0]]
        for i in 1..<meetingCount {
            freeGaps.append(meetingStarts[i] - meetingEnds[i - 1])
        }
        freeGaps.append(totalEventTime - meetingEnds[meetingCount - 1])

        // Step 2: Compute prefix maximum gaps
        var prefixMaxGaps = [freeGaps[0]]
        for i in 1..<(freeGaps.count - 1) {
            prefixMaxGaps.append(max(prefixMaxGaps.last!, freeGaps[i]))
        }

        // Step 3: Compute suffix maximum gaps
        var suffixMaxGaps = [freeGaps.last!]
        for i in stride(from: freeGaps.count - 2, to: 0, by: -1) {
            suffixMaxGaps.append(max(suffixMaxGaps.last!, freeGaps[i]))
        }
        suffixMaxGaps.reverse()

        // Step 4: Evaluate each meeting's impact
        var maxFreeTimeFound = 0
        for i in 0..<meetingCount {
            let meetingDuration = meetingEnds[i] - meetingStarts[i]
            let leftGap = freeGaps[i]
            let rightGap = freeGaps[i + 1]
            let maxGapBefore = i == 0 ? -1 : prefixMaxGaps[i - 1]
            let maxGapAfter = i == meetingCount - 1 ? -1 : suffixMaxGaps[i + 1]
            
            var potentialFreeTime = leftGap + rightGap
            if maxGapBefore >= meetingDuration || maxGapAfter >= meetingDuration {
                potentialFreeTime += meetingDuration
            }
            maxFreeTimeFound = max(maxFreeTimeFound, potentialFreeTime)
        }

        return maxFreeTimeFound
    }
}

/*
## Solution Approach

### Key Insight
The solution focuses on analyzing the free time gaps between meetings and determining how moving one meeting can maximize the largest continuous free period.

### Algorithm Steps

1. **Calculate Free Gaps**
   - Compute all free time intervals:
     - Before the first meeting
     - Between consecutive meetings
     - After the last meeting

2. **Track Maximum Gaps**
   - Create prefix maximum array (`prefixMaxGaps`) storing largest gap up to each position
   - Create suffix maximum array (`suffixMaxGaps`) storing largest gap from each position to end

3. **Evaluate Each Meeting**
   - For each meeting, calculate:
     - Free time if meeting is removed (left gap + right gap)
     - Potential additional free time if meeting can be moved to another gap
   - Track the maximum free time found

4. **Return Result**
   - The largest free time interval found during evaluation


## Complexity Analysis

### Time Complexity: O(n)
- **Calculating gaps**: O(n)
  We make a single pass through all meetings to compute free time intervals
- **Building prefix/suffix arrays**: O(n)
  Each array requires one linear pass through the gaps
- **Evaluating meetings**: O(n)
  We examine each meeting exactly once

### Space Complexity: O(n)
- **Storage for gap arrays**: O(n)
  We maintain three additional arrays of size n+1 (freeGaps, prefixMaxGaps, suffixMaxGaps)

## Example Walkthrough

### Input:
- **Event duration**: 5 hours
- **Meetings**:
  - Meeting 1: [1-2] (duration 1 hour)
  - Meeting 2: [3-5] (duration 2 hours)

### Solution Steps:

1. **Calculate Free Gaps**:
   - Before first meeting: 0-1 → [1]
   - Between meetings: 2-3 → [1, 1]
   - After last meeting: 5-5 → [1, 1, 0]

2. **Compute Maximum Gaps**:
   - **Prefix maximums**:
     - First gap: 1 → [1]
     - Second gap: max(1,1) → [1,1]
   - **Suffix maximums**:
     - Last gap: 0 → [0]
     - Previous gap: max(0,1) → [1,0] (after reversing)

3. **Evaluate Meetings**:
   - **First meeting [1-2]**:
     - Remove meeting: 1 (before) + 1 (after) = 2 hours free
     - Can move to another gap (size 1 available)
     - Potential free time: 2 + 1 = 3 hours
   - **Second meeting [3-5]**:
     - Remove meeting: 1 (before) + 0 (after) = 1 hour free
     - Cannot move to a sufficient gap (needs 2 hours)

4. **Determine Maximum**:
   - Best option: Move first meeting to create 3 hours free time
   - Without moving: Maximum is 2 hours free

### Output: 3
This markdown file provides:
1. Clear problem description
2. Detailed solution approach
3. Well-commented code with improved variable names
4. Complexity analysis
5. Concrete example walkthrough

The solution efficiently maximizes free time while maintaining code readability and optimal performance.
*/
