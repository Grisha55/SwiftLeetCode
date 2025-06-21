# 3024. Type of Triangle

## Description

You are given a 0-indexed integer array `nums` of size `3` which can form the sides of a triangle.

- A triangle is called **equilateral** if it has all sides of equal length.
- A triangle is called **isosceles** if it has exactly two sides of equal length.
- A triangle is called **scalene** if all its sides are of different lengths.
Return a string representing the type of triangle that can be formed or `"none"` if it cannot form a triangle.

## Example

**Input:**  
Input: nums = [3,3,3]
<br>
**Output:**
<br>
"equilateral"
<br>
**Explanation:**
<br>
Since all the sides are of equal length, therefore, it will form an equilateral triangle.

## Constraints

- `nums.length == 3`
- `1 <= nums[i] <= 100`
