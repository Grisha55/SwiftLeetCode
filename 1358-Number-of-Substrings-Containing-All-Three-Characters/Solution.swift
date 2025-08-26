class Solution {
  func numberOfSubstrings(_ s: String) -> Int {
    let chars = Array(s)
    var count = [0, 0, 0]
    var left = 0
    var result = 0

    for right in 0..<chars.count {
      let index = Int(chars[right].asciiValue! - Character("a").asciiValue!)
      count[index] += 1

      while count[0] > 0 && count[1] > 0 && count[2] > 0 {
        let leftIndex = Int(chars[left].asciiValue! - Character("a").asciiValue!)
        count[leftIndex] -= 1
        left += 1
      }

      result += left
    }

    return result
  }
}