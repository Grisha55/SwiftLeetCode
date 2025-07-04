# 3307. Find the K-th Character in String Game II

## Description

Alice and Bob are playing a game with strings. Initially, Alice has a string `word = "a"`.

You are given a positive integer `k` and an integer array `operations`, where `operations[i]` represents the type of the ith operation.

Now Bob will ask Alice to perform **all** operations in sequence:

- If `operations[i] == 0`, **append** a copy of `word` to itself.
- If `operations[i] == 1`, generate a new string by **changing** each character in `word` to its next character in the English alphabet, and append it to the original word. For example, performing the operation on "c" generates "cd" and performing the operaiton on "zb" generates "zbac".

Return the value of the `kth` character in `word` after performing all the operations.

Note that the character `'z'` can be changed t `'a'` in the secind type of operation.

## Examples

### Example 1:
**Input:**  
k = 5, operations = [0,0,0]  
**Output**: "a"  
  
**Explanation:** "a"  
Initially, `word == "a"`. Alice performs the three operations as follows:

- Appends `"a"` to `"a"`, `word` becomes `"aa"`.
- Appends `"aa"` to `"aa"`, `word` becomes `"aaaa"`.
- Appends `"aaaa"` to `"aaaa"`, `word` becomes `"aaaaaaaa"`.


## Constraints

- `1 <= k <= 10^14`
- `1 <= operations.length <= 100`
- `operations[i]` is either 0 or 1
- The input is gnerated such that `word` has at least `k` characters after all operations.
