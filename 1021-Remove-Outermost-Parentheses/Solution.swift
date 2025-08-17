class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var stack = [Character]()
        var res = ""

        for char in s {
            if char == "(" {
                if !stack.isEmpty {
                    res += String(char)
                }
                stack.append(char)
            } else if char == ")" {
                stack.removeLast()

                if !stack.isEmpty {
                    res += String(char)
                }
            }
        }

        return res
    }
}