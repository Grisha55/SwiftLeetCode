//
// 2099. Find Subsequence of Length K With the Largest Sum
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxSubsequence(_ nums: [Int], _ k: Int) -> [Int] {
        // Step 1: Get the top k largest elements
        // We srt the array in descending order and take the first k elements
        let topK = Array(nums.sorted(by: >).prefix(k))

        // Step 2: Count how many times each number in topK appears
        // We use a dictionary to keep track of how many times we need each number
        var neededCounts = [Int: Int]()
        for num in topK {
            neededCounts[num, default: 0] += 1
        }

        var resultArr = [Int]() // This will store the final subsequence

        // Step 3: Traverse the original array and build the result
        // We keep the original order and add elements that are in the neededCounts dictionary
        for num in nums {
            if let count = neededCounts[num], count > 0 {
                resultArr.append(num)           // Add the number to the result
                neededCounts[num]! -= 1         // Decrease the needed count
            }

            // Stop early if we already have k elements
            if resultArr.count == k {
                break
            }
        }

        return resultArr
    }
}
