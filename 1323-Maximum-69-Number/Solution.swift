class Solution {
  func maximum69Number(_ num: Int) -> Int {
    var numStrArr = Array(String(num))

    for i in 0..<numStrArr.count {
      if numStrArr[i] == "6" {
        numStrArr[i] = "9"
        return Int(String(numStrArr))!
      }
    }

    return num
  }
}