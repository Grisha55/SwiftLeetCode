# 0790. Domino and Tromino Tiling

## Description

You have two types of tiles: a `2 x 1` domino shape and a tromino shape. You may rotate these shapes.

Given an integer n, return the number of ways to tile an `2 x n` board. Since the answer may be very large, return it **modulo** `10^9 + 7`.

In a tiling, every square must be covered by a tile. Two tilings are different if and only if there are two 4-directionally adjacent cells on the board such that exactly one of the tilings has both squares occupied by a tile.

## Example

**Input:**  
n = 3
<br>
**Output:**
<br>
5
<br>
**Explanation:**
<br>
The five different ways are shown above.

## Constraints

- `1 <= n <= 1000`
