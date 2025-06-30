class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        var nums = nums.sorted() // Step 1: Sort the array
        var j = 0                // Pointer to track the start of the window
        var maxLen = 0           // Variable to store the maximum length found

        for i in 0..<nums.count {
            // Move the start pointer forward if the difference is more than 1
            while nums[i] - nums[j] > 1 {
                j += 1
            }

            // If the difference is exactly 1, check if this is the longest so far
            if nums[i] - nums[j] == 1 {
                maxLen = max(maxLen, i - j + 1)
            }
        }

        // Return the length of the longest harmonious subsequence
        return maxLen
    }
}

/*
🧠 Explained in simple words
In this solution we:
    1. Sort an array of numbers. This is important because the same and close values will go side by side.
    2. We use two pointers (double pointer or sliding window):
        - j is the beginning of the window;
        - i - the current element.
    3. As long as the difference between nums[i] and nums[j] is greater than 1 - we slide j to the right.
    4. If the difference is exactly 1, we have found a harmonious subsequence - update maxLen.
    5. Eventually we return the longest such subsequence.

This approach works for O(n log n) because of sorting.
*/
