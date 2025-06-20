//
// 0448. Find All Numbers Disappeared in an Array
// Problem: https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums // Make a mutable copy of the input array

        // First pass: mark numbers we've seen by negating the value at the corresponding index
        for i in 0..<nums.count {
            let index = abs(nums[i]) - 1    // Get the index corresponding to the value
            if nums[index] > 0 {            // Only negate if it's not already negated
                nums[index] = -nums[index]  // Mark the number as seen
            }
        }

        var result: [Int] = [] // Array to store missing numbers

        // Second pass: the indexes with positive values are the missing numbers
        for i in 0..<nums.count {
            if nums[i] > 0 {            // If the number is still positive
                result.append(i + 1)    // Then (i + 1) was missing from the original array
            }
        }

        // Return the list of missing numbers
        return result
    }
}

/*
🧠 Simple explanation:
The function finds all missing numbers in the nums array, where the numbers must be from 1 to n (inclusive), and n is the length of the array.

For example, if we have an array [4,3,2,7,8,2,3,1], then it does not contain the numbers 5 and 6. These are the ones that the function should return.

⚠️ Main idea:
We use the nums array itself to store information about which numbers have already been encountered, changing the sign to negative at the corresponding index. After that, we simply look at where the numbers remain positive - these are the missing numbers.

🔍 Step-by-step example:
let nums = [4,3,2,7,8,2,3,1]
    1. We go through the array:
        - We see 4 → mark nums[3] = -7
        - We see 3 → nums[2] = -2
        - We see 2 → nums[1] = -3
        - We see 7 → nums[6] = -3
        - We see 8 → nums[7] = -1
        - We see 2 → nums[1] is already negative → skip
        - We see 3 → nums[2] is already negative → skip
        - We see 1 → nums[0] = -4

    2. Now the array became:
    [-4, -3, -2, -7, 8, 2, -3, -1]

    3. Second pass — we look for positive values:
        - nums[4] = 8 → then there was no number 5
        - nums[5] = 2 → then there was no number 6
✅ Result: [5, 6]

📌 Conclusion:
- The algorithm works in O(n) time and O(1) additional memory (not counting the result).
- A very effective way to “mark” encountered numbers without using hash tables.
- Based on the fact that the numbers in the array are from 1 to n.
*/
