# 0135. Candy

## Description

There are `n` children standing in a line. Each child is assigned a rating value given in the integer array `ratings`.

You are giving candies to these children subjected to the following requirements:

- Each child must have at least one candy.
- Children with a higher rating get more candies than their neighbors.
<br>
Return the minimum number of candies you need to have to distribute the candies to the children.

## Example

**Input:**  
<br>
ratings = [1,0,2]
<br>
**Output:**
<br>
5
<br>
**Explanation:**
<br>
You can allocate to the first, second and third child with 2, 1, 2 candies respectively.

## Constraints

- `n == ratings.length`
- `1 <= n <= 2 * 10^4`
- `0 <= ratings[i] <= 2 * 10^4`

