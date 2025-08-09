class Solution {
  func findLonely(_ nums: [Int]) -> [Int] {
    var lonelyNums = [Int]()
    var frequencyDict = [Int: Int]()

    for num in nums {
      frequencyDict[num, default: 0] += 1
    }

    for (num, count) in frequencyDict {
      if count == 1 && !frequencyDict.keys.contains(num - 1) && !frequencyDict.keys.contains(num + 1) {
        lonelyNums.append(num)
      }
    }

    return lonelyNums
  }
}