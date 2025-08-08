class Solution {
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var frequentDict = [Int: Int]()

    for num in nums {
      frequentDict[num, default: 0] += 1
    }

    let sortedFrequent = frequentDict.sorted { $0.value > $1.value }
    for i in 0..<k {
      result.append(sortedFrequent[i].key)
    }

    return result
  }
}