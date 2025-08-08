class Solution {
  func vowelStrings(_ words: [String], _ left: Int, _ right: Int) -> Int {
    let vowels = ["a", "e", "i", "o", "u"]
    var resultSet = Set<String>()
    for i in left...right {
      let str = words[i]
      if str.count < 1 || !vowels.contains(String(str.first!)) || !vowels.contains(String(str.last!)) {
        continue
      }
      if vowels.contains(String(str.first!)) && vowels.contains(String(str.last!)) {
        resultSet.insert(str)
      } 
    }

    return resultSet.count
  }
}