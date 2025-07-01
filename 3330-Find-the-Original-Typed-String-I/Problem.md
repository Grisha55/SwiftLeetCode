# 3330. Alice and the Long Pressed Key

Alice is attempting to type a specific string on her computer. However, she tends to be clumsy and may press a key for too long, resulting in a character being typed multiple times.

Although Alice tried to focus on her typing, she is aware that she may still have done this at most once.

You are given a string `word`, which represents the final output displayed on Alice's screen.

Return the total number of possible original strings that Alice might have intended to type.

## Example 1:

Input: word = "aabb"
Output: 4

Explanation: The possible original strings could be:
- "aabb" (no long press at all)
- "ab"   (long press on both 'a' and 'b')
- "aab"  (long press only on 'b')
- "abb"  (long press only on 'a')

## Constraints:
- `1 <= word.length <= 100`
- `word` consists only of lowercase English letters.

