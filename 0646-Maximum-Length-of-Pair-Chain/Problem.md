# 0646. Maximum Length of Pair Chain

## Description

You are given an array of `n` pairs `pairs` where `pairs[i] = [lefti, righti]` and `lefti < righti`.

A pair `p2 = [c, d]` **follows** a pair `p1 = [a, b]` if `b < c`. A chain of pairs can be formed in this fashion.

Return the length longest chain which can be formed.

You do not need to use up all the given intervals. You can select pairs in any order.

## Example

**Input:**  
pairs = [[1,2],[2,3],[3,4]]
<br>
**Output:**
<br>
2
<br>
**Explanation:**
<br>
The longest chain is [1,2] -> [3,4].

## Constraints

- `n == pairs.length`
- `1 <= n <= 1000`
- `-1000 <= lefti < righti <= 1000`
