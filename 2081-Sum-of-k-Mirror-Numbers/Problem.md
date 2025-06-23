# 2081. Sum of k-Mirror Numbers

## Description

A **k-mirror** number is a **positive** integer **without leading zeros** that reads the same both forward and backward in base-10 **as well as** in base-k.

    - For example, `9` is a 2-mirror number. The representation of `9` in base-10 and base-2 are `9` and `1001` respectively, which read the same both forward and backward.
    - On the contrary, `4` is not a 2-mirror number. The representation of `4` in base-2 is `100`, which does not read the same both forward and backward.
Given the base `k` and the number `n`, return the **sum** of the `n` **smallest** k-mirror numbers.

## Example

**Input:**  
k = 2, n = 5
<br>
**Output:**
<br>
25
<br>
**Explanation:**
<br>
The 5 smallest 2-mirror numbers and their representations in base-2 are listed as follows:
<br>
  base-10    base-2
    <br>
    1          1
    <br>
    3          11
    <br>
    5          101
    <br>
    7          111
    <br>
    9          1001
    <br>
Their sum = 1 + 3 + 5 + 7 + 9 = 25.

## Constraints

- `2 <= k <= 9`
- `1 <= n <= 30`
