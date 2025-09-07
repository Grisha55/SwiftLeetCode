class Solution {
    func sumZero(_ n: Int) -> [Int] {
        var res = [Int]()
        var sum = 0

        for i in 1..<n {
            res.append(i)
        }

        for num in res {
            sum += num
        }

        res.append(-sum)
        sum = 0
        return res
    }
}