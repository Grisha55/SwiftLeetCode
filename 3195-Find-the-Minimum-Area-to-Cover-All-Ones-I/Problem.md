# 3195. Find the Minimum Area to Cover All Ones I

## Description

You are given a 2D binary array grid. Find a rectangle with horizontal and vertical sides with the smallest area, such that all the 1's in grid lie inside this rectangle.

Return the minimum possible area of the rectangle.

## Example

**Input:**
grid = [[0,1,0],[1,0,1]]
<br>
**Output:**
<br>
6
<br>
**Explanation:**
<br>
The smallest rectangle has a height of 2 and a width of 3, so it has an area of 2 \* 3 = 6.

## Constraints

- `1 <= grid.length, grid[i].length <= 1000`
- `grid[i][j]` is either 0 or 1.
- The input is generated such that there is at least one 1 in `grid`.
