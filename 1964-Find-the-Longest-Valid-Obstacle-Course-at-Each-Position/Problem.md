# 1964. Find the Longest Valid Obstacle Course at Each Position

## Description

You want to build some obstacle courses. You are given a **0-indexed** integer array `obstacles` of length `n`, where `obstacles[i]` describes the height of the `ith` obstacle.

For every index `i` between `0` and `n - 1` (**inclusive**), find the length of the **longest obstacle course** in `obstacles` such that:

- You choose any number of obstacles between `0` and `i` **inclusive**.
- You must include the `ith` obstacle in the course.
- You must put the chosen obstacles in the **same order** as they appear in `obstacles`.
- Every obstacle (except the first) is **taller** than or the **same height** as the obstacle immediately before it.
Return an array `ans` of length `n`, where `ans[i]` is the length of the **longest obstacle course** for index `i` as described above.

## Example

**Input:**  
obstacles = [1,2,3,2]
<br>
**Output:**
<br>
[1,2,3,3]
<br>
**Explanation:**
<br>
The longest valid obstacle course at each position is:
<br>
- i = 0: [1], [1] has length 1.
<br>
- i = 1: [1,2], [1,2] has length 2.
<br>
- i = 2: [1,2,3], [1,2,3] has length 3.
<br>
- i = 3: [1,2,3,2], [1,2,2] has length 3.

## Constraints

- `n == obstacles.length`
- `1 <= n <= 10^5`
- `1 <= obstacles[i] <= 10^7`
