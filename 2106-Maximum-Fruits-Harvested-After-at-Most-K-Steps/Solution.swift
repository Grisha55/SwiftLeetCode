//
// 2106. Maximum Fruits Harvested After at Most K Steps
// SwiftLeetCode
//

class Solution {
    func maxTotalFruits(_ fruits: [[Int]], _ startPos: Int, _ k: Int) -> Int {
        var maxSum = 0
        let n = fruits.count
        
        // Check if we can collect fruits at startPos with k=0
        if k == 0 {
            for fruit in fruits {
                if fruit[0] == startPos {
                    return fruit[1]
                }
            }
            return 0
        }
        
        // Precompute prefix sums for efficient range sum calculation
        var prefixSums = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            prefixSums[i + 1] = prefixSums[i] + fruits[i][1]
        }
        
        // Find the rightmost position we can reach by going right first
        let right = findRightBound(fruits, startPos, k)
        let leftForRight = findLeftBound(fruits, startPos, 0)
        maxSum = prefixSums[right + 1] - prefixSums[leftForRight]
        
        // Find the leftmost position we can reach by going left first
        let left = findLeftBound(fruits, startPos, k)
        let rightForLeft = findRightBound(fruits, startPos, 0)
        maxSum = max(maxSum, prefixSums[rightForLeft + 1] - prefixSums[left])
        
        // Check all possible combinations of left and right movements
        var l = 0
        while l < n && fruits[l][0] <= startPos {
            let remainingSteps = k - 2 * (startPos - fruits[l][0])
            if remainingSteps < 0 {
                l += 1
                continue
            }
            let r = findRightBound(fruits, startPos, remainingSteps)
            let current = prefixSums[r + 1] - prefixSums[l]
            maxSum = max(maxSum, current)
            l += 1
        }
        
        var r = n - 1
        while r >= 0 && fruits[r][0] >= startPos {
            let remainingSteps = k - 2 * (fruits[r][0] - startPos)
            if remainingSteps < 0 {
                r -= 1
                continue
            }
            let l = findLeftBound(fruits, startPos, remainingSteps)
            let current = prefixSums[r + 1] - prefixSums[l]
            maxSum = max(maxSum, current)
            r -= 1
        }
        
        return maxSum
    }

    // Helper function to find the rightmost index we can reach
    private func findRightBound(_ fruits: [[Int]], _ startPos: Int, _ steps: Int) -> Int {
        var left = 0
        var right = fruits.count - 1
        var result = -1  // Initialize to -1 to handle cases where no position is reachable
        
        let maxPos = startPos + steps
        
        while left <= right {
            let mid = left + (right - left) / 2
            if fruits[mid][0] <= maxPos {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return result
    }

    // Helper function to find the leftmost index we can reach
    private func findLeftBound(_ fruits: [[Int]], _ startPos: Int, _ steps: Int) -> Int {
        var left = 0
        var right = fruits.count - 1
        var result = fruits.count  // Initialize to count to handle cases where no position is reachable
        
        let minPos = startPos - steps
        
        while left <= right {
            let mid = left + (right - left) / 2
            if fruits[mid][0] >= minPos {
                result = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return result
    }
}

/*
Time Complexity - O(n logn)
Space Complexity - O(n)
*/
