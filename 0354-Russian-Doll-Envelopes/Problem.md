# 0354. Russian Doll Envelopes

## Description

You are given a 2D array of integers `envelopes` where `envelopes[i] = [wi, hi]` represents the width and the height of an envelope.

One envelope can fit into another if and only if both the width and height of one envelope are greater than the other envelope's width and height.

Return the maximum number of envelopes you can Russian doll (i.e., put one inside the other).

**Note:** You cannot rotate an envelope.

## Example

**Input:**  
envelopes = [[5,4],[6,4],[6,7],[2,3]]
<br>
**Output:**
<br>
3
<br>
**Explanation:**
<br>
The maximum number of envelopes you can Russian doll is 3 ([2,3] => [5,4] => [6,7]).

## Constraints

- `1 <= envelopes.length <= 10^5`
- `envelopes[i].length == 2`
- `1 <= wi, hi <= 10^5`
