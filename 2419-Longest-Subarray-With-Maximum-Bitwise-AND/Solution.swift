//
// 2419. Longest Subarray With Maximum Bitwise AND
// SwiftLeetCode
//

class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        // The maximum bitwise AND of any subarray is the maximum element in the array
        // because AND operation can only maintain or reduce bits set
        let maxAND = nums.max()!

        var currentLength = 0
        var maxLength = 0

        // Iterate through the array to find the longest sequence of maxAND values
        for num in nums {
            if num == maxAND {
                currentLength += 1
                maxLength = max(maxLength, currentLength)
            } else {
                currentLength = 0
            }
        }

        return maxLength
    }
}

/*
Explanation:
1. Key Insight:
    - The maximum possible bitwise AND of any subarray will always be equal to the maximum single element in the array. This is because the AND operation can only preserve or remove set bits, never add new ones.
    - For example, a & b will always be ≤ both a and b.
2. Algorithm:
    - First, find the maximum value in the array (maxAND), which will be our target value.
    - Then scan through the array to find the longest contiguous sequence of this maximum value.
    - The length of this longest sequence is our answer.
3. Time Complexity:
    - O(n) - We make two passes through the array: one to find the maximum, and another to find the longest sequence.
4. Space Complexity:
    - O(1) - We only use a few variables for tracking lengths, regardless of input size.
5. Edge Cases:
    - If all elements are the same, the entire array is the longest subarray.
    - If the maximum appears only once, the answer is 1.
    - For an empty array (though the problem states n is the size, implying n ≥ 1).
*/
