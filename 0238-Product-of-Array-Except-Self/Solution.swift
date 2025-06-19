//
// 0238. Product of Array Except Self
// Problem: https://leetcode.com/problems/product-of-array-except-self/
// SwiftLeetCode
//

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var n = nums.count // length of the input array

        // // Create the output array filled with 1s
        var answer = Array(repeating: 1, count: n)

        // left will store the product of elements to the left of current index
        var left = 1
        for i in 0..<n {
            answer[i] = left // Set the current answer to the product of left elements
            left *= nums[i] // Update left product by multiplying current element
        }

        // right will store the product of elements to the right of current index
        var right = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            answer[i] *= right // Multiply the existing value with the product of right elements
            right *= nums[i]   // Update right product by multiplying with current element
        }

        // Return the final result array
        return answer
    }

    /*
    How this solution works:
    1. Create an array answer filled with ones.
    2. First, go left to right and count the products of all the elements to the left of the current one.
       For example, for position i = 2 (value 3), we write 1 * 2 = 2 (everything that was to the left).
    3. Then go right to left and multiply each element by the product of all the elements to the right.
    4. As a result, each cell will have the product of all the numbers except the current one.
    */
}
