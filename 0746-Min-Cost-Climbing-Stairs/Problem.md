# 0746. Min Cost Climbing Stairs

## Description

You are given an integer array `cost` where `cost[i]` is the cost of `ith` step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index `0`, or the step with index `1`.

Return the minimum cost to reach the top of the floor.

## Example

**Input:**  
cost = [10,15,20]
<br>
**Output:**
<br>
15
<br>
**Explanation:**
<br>
You will start at index 1.
<br>
- Pay 15 and climb two steps to reach the top.
<br>
The total cost is 15.

## Constraints

- `2 <= cost.length <= 1000`
- `0 <= cost[i] <= 999`
