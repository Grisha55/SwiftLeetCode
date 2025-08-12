class Solution {
    func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
        var arrayOfSums = [Int]()

        for i in 0..<n {
            var sum = 0
            for j in i..<n {
                sum += nums[j]
                arrayOfSums.append(sum)
            }
        }

        arrayOfSums.sort()

        let mod = 1_000_000_007
        var res = 0
        for i in (left - 1)...(right - 1) {
            res = (res + arrayOfSums[i]) % mod
        }

        return res
    }
}