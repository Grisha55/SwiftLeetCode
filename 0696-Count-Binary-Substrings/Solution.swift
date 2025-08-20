class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        var prev = 0
        var curr = 1

        for i in 1..<s.count {
            if chars[i] == chars[i - 1] {
                curr += 1
            } else {
                count += min(prev, curr)
                prev = curr
                curr = 1
            }
        }

        count += min(prev, curr)

        return count
    }
}