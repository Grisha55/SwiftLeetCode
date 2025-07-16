//
// 3201. Find the Maximum Length of Valid Subsequence I
// SwiftLeetCode
//

class Solution {
    func maximumLength(_ nums: [Int]) -> Int {
        var res = 0
        let variants = [[0, 0], [0, 1], [1, 0], [1, 1]]
        
        for variant in variants {
            var count = 0
            for num in nums {
                let parity = num % 2
                if parity == variant[count % variant.count] {
                    count += 1
                }
            }
            res = max(res, count)
        }
        
        return res
    }
}

/*
Time complexity - O(n)
Space complexity - O(1)

This solution finds the maximum length of a valid subsequence where all consecutive elements alternate between even and odd numbers. It also considers cases where all elements are even or all are odd.

How It Works:
1. Four Patterns Tested:
    - [0, 0]: All even numbers
    - [0, 1]: Alternating even-odd
    - [1, 0]: Alternating odd-even
    - [1, 1]: All odd numbers

2. For Each Pattern:
    - Initialize a counter (cnt)
    - Check each number in nums:
        - If number's parity (num % 2) matches the current position in pattern (pattern[cnt % 2])
        - Increment counter if matched
    - Track maximum counter value across all patterns (res)

3. Returns:
    - Length of longest matching subsequence

Why It's Correct:
- Tests all possible valid parity sequences
- Handles both uniform (all even/odd) and alternating cases
- Efficient O(n) time per pattern (4 patterns total)
*/
