# 2264. Largest 3-Same-Digit Number in String

## Description

You are given a string `num` representing a large integer. An integer is good if it meets the following conditions:

- It is a substring of `num` with length `3`.
- It consists of only one unique digit.
Return the maximum good integer as a string or an empty string `""` if no such integer exists.

Note:

A substring is a contiguous sequence of characters within a string.
There may be leading zeroes in `num` or a good integer.

## Example

**Input:**  
num = "6777133339"
<br>
**Output:**
<br>
"777"
<br>
**Explanation:**
<br>
There are two distinct good integers: "777" and "333".
"777" is the largest, so we return "777".

## Constraints

- `3 <= num.length <= 1000`
- `num` only consists of digits.