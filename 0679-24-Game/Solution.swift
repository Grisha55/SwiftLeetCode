class Solution {
    func judgePoint24(_ cards: [Int]) -> Bool {
        let nums = cards.map { Double($0) }
        
        return tryAllOperations(nums)
    }

    private func tryAllOperations(_ nums: [Double]) -> Bool {
        let finalSum = 24.0
        let n = nums.count

        if n == 1 {
            return abs(nums[0] - finalSum) < 1e-6
        }

        for i in 0..<n {
            for j in 0..<n where j != i {
                var nextNums = [Double]()

                for k in 0..<n where k != i && k != j {
                    nextNums.append(nums[k])
                }

                let x = nums[i]
                let y = nums[j]

                nextNums.append(x + y)
                if tryAllOperations(nextNums) {
                    return true
                }
                nextNums.removeLast()

                nextNums.append(x - y)
                if tryAllOperations(nextNums) {
                    return true
                }
                nextNums.removeLast()

                nextNums.append(y - x)
                if tryAllOperations(nextNums) {
                    return true
                }
                nextNums.removeLast()

                nextNums.append(x * y)
                if tryAllOperations(nextNums) {
                    return true
                }
                nextNums.removeLast()

                if y != 0 {
                    nextNums.append(x / y)
                    if tryAllOperations(nextNums) {
                        return true
                    }
                    nextNums.removeLast()
                }

                if x != 0 {
                    nextNums.append(y / x)
                    if tryAllOperations(nextNums) {
                        return true
                    }
                    nextNums.removeLast()
                }
            }
        }
        
        return false
    }
}