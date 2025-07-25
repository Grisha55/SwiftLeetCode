class Solution {
    func maxSum(_ nums: [Int]) -> Int {
        var numsSet: Set<Int> = []
        for num in nums {
            if num > 0 {
                numsSet.insert(num)
            }
        }

        if numsSet.count > 0 {
            return numsSet.reduce(0, +)
        }
        return nums.max() ?? 0
    }
}

/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
