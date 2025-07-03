# 3304. Find the K-th Character After Decryption

## Description

Alice and Bob are playing a game. Initially, Alice has a string `word = "a"`.

You are given a positive integer `k`.

Bob asks Alice to perform the following operation infinitely:

- Generate a new string by changing each character in `word` to its next character in the English alphabet (wrapping from 'z' to 'a'), and **append** it to the original word.

For example:
- Performing the operation on `"c"` gives `"cd"`.
- Performing the operation on `"zb"` gives `"zbac"`.

Return the value of the k-th character in the word, after performing enough operations so that the word has **at least k characters**.

## Example 1

**Input:**  
k = 5
<br>
**Output:**
<br>
"b"
<br>
**Explanation:**
<br>
Initially, word = "a". We need to do the operation three times:

- Generated string is "b", word becomes "ab".
- Generated string is "bc", word becomes "abbc".
- Generated string is "bccd", word becomes "abbcbccd".

## Constraints

- `1 <= k <= 500`
