class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var res = ""
        var carry = 0
        let n = max(num1.count, num2.count)
        let num1Rev = Array(num1.reversed())
        let num2Rev = Array(num2.reversed())

        for i in 0..<n {
            let numOne = i < num1Rev.count ? Int(String(num1Rev[i]))! : 0
            let numTwo = i < num2Rev.count ? Int(String(num2Rev[i]))! : 0

            let sum = numOne + numTwo + carry
            carry = sum / 10
            res.append(String(sum % 10))
        }

        if carry > 0 {
            res.append(String(carry))
        }

        return String(res.reversed())
    }
}