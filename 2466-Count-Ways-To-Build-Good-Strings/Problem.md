# 2466. Count Ways To Build Good Strings

## Description

Given the integers `zero`, `one`, `low`, and `high`, we can construct a string by starting with an empty string, and then at each step perform either of the following:

- Append the character `'0'` `zero` times.
- Append the character `'1'` `one` times.
This can be performed any number of times.

A **good** string is a string constructed by the above process having a **length** between `low` and `high` (**inclusive**).

Return the number of **different** good strings that can be constructed satisfying these properties. Since the answer can be large, return it modulo `10^9 + 7`.

## Example

**Input:**  
low = 3, high = 3, zero = 1, one = 1
<br>
**Output:**
<br>
8
<br>
**Explanation:**
<br>
One possible valid good string is "011". 
<br>
It can be constructed as follows: "" -> "0" -> "01" -> "011". 
<br>
All binary strings from "000" to "111" are good strings in this example.

## Constraints

- `1 <= low <= high <= 10^5`
- `1 <= zero, one <= low`
