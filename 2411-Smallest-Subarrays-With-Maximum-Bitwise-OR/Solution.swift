//
// 2411. Smallest Subarrays With Maximum Bitwise OR
// SwiftLeetCode
//

class Solution {
    func smallestSubarrays(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var pos = [Int](repeating: -1, count: 31) // Track last positions of set bits (31 bits for positive numbers)
        var ans = [Int](repeating: 1, count: n)   // Initialize answer array with minimum length 1
        
        // Process the array from right to left
        for i in stride(from: n - 1, through: 0, by: -1) {
            var maxJ = i // Initialize the farthest position to current index
            
            // Check each bit position (0 to 30)
            for bit in 0..<31 {
                if (nums[i] & (1 << bit)) == 0 {
                    // If current bit is not set, check if we've seen this bit set before
                    if pos[bit] != -1 {
                        // Update maxJ to the farthest position where this bit is set
                        maxJ = max(maxJ, pos[bit])
                    }
                } else {
                    // If current bit is set, update its last seen position
                    pos[bit] = i
                }
            }
            
            // The smallest subarray length is from i to maxJ
            ans[i] = maxJ - i + 1
        }
        
        return ans
    }
}

/*
Time Complexity - O(n * log n)
Space Complexity - O(log n)
*/
