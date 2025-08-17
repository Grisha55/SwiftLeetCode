class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var length = 0
        var stack: [Int] = [-1]
        var sArr = Array(s)

        for i in 0..<sArr.count {
            if sArr[i] == "(" {
                stack.append(i)
            } else {
                stack.removeLast()

                if stack.count == 0 {
                    stack.append(i)
                } else {
                    length = max(length, i - stack.last!)
                }
            }
        }

        return length
    }
}