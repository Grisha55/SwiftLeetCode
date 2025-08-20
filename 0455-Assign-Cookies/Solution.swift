class Solution {
  func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    var sortedG = g.sorted()
    var sortedS = s.sorted()
    
    var childIndex = 0
    var cookieIndex = 0
    
    while childIndex < sortedG.count && cookieIndex < sortedS.count {
      if sortedS[cookieIndex] >= sortedG[childIndex] {
        // Cookie can satisfy the child's greed
        childIndex += 1
      }
      // Move to the next cookie
      cookieIndex += 1
    }
    
    return childIndex // Number of content children
  }
}