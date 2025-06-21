# 1011. Capacity To Ship Packages Within D Days

## Description

A conveyor belt has packages that must be shipped from one port to another within `days` days.

The `ith` package on the conveyor belt has a weight of `weights[i]`. Each day, we load the ship with packages on the conveyor belt (in the order given by `weights`). We may not load more weight than the maximum weight capacity of the ship.

Return the least weight capacity of the ship that will result in all the packages on the conveyor belt being shipped within `days` days.

## Example

**Input:**  
weights = [1,2,3,4,5,6,7,8,9,10], days = 5
<br>
**Output:**
<br>
15
<br>
**Explanation:**
<br>
A ship capacity of 15 is the minimum to ship all the packages in 5 days like this:
<br>
1st day: 1, 2, 3, 4, 5
<br>
2nd day: 6, 7
<br>
3rd day: 8
<br>
4th day: 9
<br>
5th day: 10
<br>

Note that the cargo must be shipped in the order given, so using a ship of capacity 14 and splitting the packages into parts like (2, 3, 4, 5), (1, 6, 7), (8), (9), (10) is not allowed.

## Constraints

- `1 <= days <= weights.length <= 5 * 10^4`
- `1 <= weights[i] <= 500`
