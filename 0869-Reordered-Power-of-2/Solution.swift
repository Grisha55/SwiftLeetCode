class Solution {
  func reorderedPowerOf2(_ n: Int) -> Bool {
    let digits = String(n).sorted()
    var powerOfTwo = 1

    while powerOfTwo <= 1_000_000_000 {
      if String(powerOfTwo).sorted() == digits {
        return true
      }
      powerOfTwo *= 2
    }

    return false
  }
}