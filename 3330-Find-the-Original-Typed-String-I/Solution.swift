class Solution {
    func possibleStringCount(_ word: String) -> Int {
        let chars = Array(word)
        let n = chars.count
        var copies = 1

        for i in 1..<n {
            if chars[i - 1] == chars[i] {
                copies += 1
            }
        }

        return copies
    }
}
