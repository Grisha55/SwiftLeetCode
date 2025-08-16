class Solution {
  func smallestNumber(_ pattern: String) -> String {
    var result = ""
    var stack = [Int]()
    
    for (i, char) in pattern.enumerated() {
      let num = i + 1
      stack.append(num)
      
      if char == "I" {
        while !stack.isEmpty {
          result += String(stack.removeLast())
        }
      }
    }
    
    stack.append(pattern.count + 1)
    
    while !stack.isEmpty {
      result += String(stack.removeLast())
    }
    
    return result
  }
}