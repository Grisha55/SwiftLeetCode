# 1353. Maximum Number of Events That Can Be Attended

## Description

You are given an array of `events` where `events[i] = [startDayi, endDayi]`. Every event `i` starts at `startDayi` and ends at `endDayi`.

You can attend an event `i` at any day `d` where `startTimei <= d <= endTimei`. You can only attend one event at any time `d`.

Return the maximum number of events you can attend.

## Example

**Input:**  
events = [[1,2],[2,3],[3,4]]
<br>
**Output:**
<br>
3
<br>
**Explanation:**
<br>
You can attend all the three events.  
One way to attend them all is as shown.  
Attend the first event on day 1.  
Attend the second event on day 2.  
Attend the third event on day 3.  

## Constraints

- `1 <= events.length <= 10^5`
- `events[i].length == 2`
- `1 <= startDayi <= endDayi <= 10^5`
