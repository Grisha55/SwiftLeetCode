//
// 0442. Find All Duplicates in an Array
// Problem: https://leetcode.com/problems/find-all-duplicates-in-an-array/
// SwiftLeetCode
//

import Foundation

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums         // Make a mutable copy of the input array
        var result: [Int] = []  // Array to store duplicates

        for i in 0..<nums.count {           // Loop through each element
            let index = abs(nums[i]) - 1    // Get the index based on the value (adjusted to 0-based index)

            if nums[index] < 0 {
                // If the value at that index is negative,
                // it means we've seen this number before → it's a duplicate
                result.append(index + 1)
            } else {
                // Otherwise, mark the number as seen by negating the value at that index
                nums[index] = -nums[index]
            }
        }

        return result // Return the list of duplicates
    }
}

/*
🧠 Simple explanation:
The function finds all duplicate numbers in the array nums, where the numbers are in the range from 1 to n (where n is the length of the array).
⚠️ Key idea: use the sign of a number in the array as a way to mark that we have already seen this number.

🔧 How it works step by step:
1. We go through the array.
2. For each number x (for example, 3), we look at the cell with index x - 1 (that is, 2).
3. If the value there is already negative, then we have already seen x → it is a duplicate.
4. Otherwise, we make this value negative to mark that x has already been.


📦 Example:
let nums = [4,3,2,7,8,2,3,1]
Process:
    See 4 → set nums[3] = -7
    See 3 → set nums[2] = -2
    See 2 → set nums[1] = -3
    See 7 → set nums[6] = -3
    See 8 → set nums[7] = -1
    See 2 → look at nums[1], already -3 → duplicate 2
    See 3 → nums[2] already -2 → duplicate 3

Result: [2, 3]
*/
