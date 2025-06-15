# 1432. Max Difference You Can Get From Changing an Integer

## Description

You are given an integer `num`. You will apply the following steps to `num` two separate times:

1. Pick a digit `x` (0 <= x <= 9).
2. Pick another digit `y` (0 <= y <= 9). Note: `y` can be equal to `x`.
3. Replace **all** the occurrences of `x` in the decimal representation of `num` by `y`.

Let `a` and `b` be the two results from applying the operation to `num` independently.

Return the **maximum difference** between `a` and `b`.

**Note:**
- Neither `a` nor `b` may have any leading zeros.
- `a` and `b` must not be 0.

## Example

### Example 1
**Input:**  
`num = 555`  
**Output:**  
`888`  
**Explanation:**  
You can replace all 5's with 9 to get 999, and with 1 to get 111. Difference is 888.

### Example 2
**Input:**  
`num = 9`  
**Output:**  
`8`  

## Constraints

- `1 <= num <= 10^8`

