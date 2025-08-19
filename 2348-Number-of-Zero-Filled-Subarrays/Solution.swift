class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var numberOfZeroes = 0
        var result = 0
        
        for num in nums {
            if num == 0 {
                numberOfZeroes += 1
                result += numberOfZeroes
            } else {
                numberOfZeroes = 0
            }
        }

        return result
    }
}