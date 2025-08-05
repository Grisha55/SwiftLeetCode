class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var countDict = [Int: Int]()
        let n = nums.count
        var resultSet = Set<Int>()

        for num in nums {
          countDict[num, default: 0] += 1
        }

        for key in countDict.keys {
          if countDict[key, default: 0] > n / 3 {
            resultSet.insert(key)
          } 
        }

        return Array(resultSet)
    }
}