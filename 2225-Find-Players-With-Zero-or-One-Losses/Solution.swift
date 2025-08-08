class Solution {
  func findWinners(_ matches: [[Int]]) -> [[Int]] {
    var losersDict = [Int: Int]()
    var losers = [Int]()
    var winners = Set<Int>()
    var a = [Int]()
        
    for i in 0..<matches.count {
      winners.insert(matches[i][0])
    }
        
    for i in 0..<matches.count {
      losersDict[matches[i][1], default: 0] += 1
    }
        
    for key in losersDict.keys {
      if losersDict[key]! == 1 {
        losers.append(key)
      }
    }
      
    return [winners.filter ({ losersDict[$0] == nil }).sorted(), losers.sorted()]
  }
}