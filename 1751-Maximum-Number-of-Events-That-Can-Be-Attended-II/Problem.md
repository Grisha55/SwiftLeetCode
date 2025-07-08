# 1751. Maximum Number of Events That Can Be Attended II

## Description

You are given an array of `events` where `events[i] = [startDayi, endDayi, valuei]`. The `ith` event starts at `startDayi` and ends at `endDayi`, and if you attend this event, you will receive a value of `valuei`. You are also given an integer `k` which represents the maximum number of events you can attend.

You can only attend one event at a time. If you choose to attend an event, you must attend the entire event. Note that the end day is inclusive: that is, you cannot attend two events where one of them starts and the other ends on the same day.

Return the **maximum sum** of values that you can receive by attending events.

## Example

**Input:**  
events = [[1,2,4],[3,4,3],[2,3,1]], k = 2
<br>
**Output:**
<br>
7
<br>
**Explanation:**
<br>
Choose the green events, 0 and 1 (0-indexed) for a total value of 4 + 3 = 7.

## Constraints

- `1 <= k <= events.length`
- `1 <= k * events.length <= 10^6`
- `1 <= startDayi <= endDayi <= 10^9`
- `1 <= valuei <= 10^6`
