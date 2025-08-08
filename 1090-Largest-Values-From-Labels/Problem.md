# 1090. Largest Values From Labels

## Description

You are given `n` item's value and label as two integer arrays `values` and `labels`. You are also given two integers `numWanted` and `useLimit`.

Your task is to find a subset of items with the maximum sum of their values such that:

- The number of items is at most `numWanted`.
- The number of items with the same label is at most `useLimit`.
Return the maximum sum.

## Example

**Input:**  
 values = [5,4,3,2,1], labels = [1,1,2,2,3], numWanted = 3, useLimit = 1
<br>
**Output:**
<br>
9
<br>
**Explanation:**
<br>
The subset chosen is the first, third, and fifth items with the sum of values 5 + 3 + 1.

## Constraints

- `n == values.length == labels.length`
- `1 <= n <= 2 * 10^4`
- `0 <= values[i], labels[i] <= 2 * 10^4`
- `1 <= numWanted, useLimit <= n`
