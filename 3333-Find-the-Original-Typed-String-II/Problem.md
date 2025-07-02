# 3333. Find the Original Typed String II

Alice is a poor typer. She has a habit of long pressing keys. As a result, some characters may be repeated 1 or more times in the typed string.

You are given a string `word` and an integer `k`.

Return the number of possible original strings of length at least `k` that Alice could have typed to obtain `word`. Since the answer may be very large, return it modulo 10⁹ + 7.

### Example 1:
Input: word = "aabb", k = 2  
Output: 4  
Explanation: Possible original strings are: "ab", "aab", "abb", "aabb".  


### Constraints:
- `1 <= word.length <= 200`
- `1 <= k <= 2000`
- `word` consists only of lowercase English letters.

