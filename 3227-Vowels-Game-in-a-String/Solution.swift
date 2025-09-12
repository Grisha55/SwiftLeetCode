class Solution {
    func doesAliceWin(_ s: String) -> Bool {
        let vowels = "aeiou"
        return s.contains(where: { vowels.contains($0) })
    }
}