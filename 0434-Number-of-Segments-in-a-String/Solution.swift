class Solution {
    func countSegments(_ s: String) -> Int {
        var count = 0
        var inBrackets = false

        for char in s {
            if char != " " {
                if !inBrackets {
                    count += 1
                    inBrackets = true
                }
            } else {
                inBrackets = false
            }
        }

        return count
    }
}