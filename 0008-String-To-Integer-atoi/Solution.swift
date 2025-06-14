//
// 0008. String to Interger (atoi)
// Problem: https://leetcode.com/problems/string-to-integer-atoi/
// SwiftLeetCode
//

func myAtoi(_ s: String) -> Int {
    var result = 0
    var sign: Int = 1 // The sign of result value
    var i = 0

    // 1. Skip whitespaces
    while i < s.count && s[s.index(s.startIndex, offsetBy: i)].isWhitespace {
        i += 1
    }

    // 2. Consider the sign
    if i < s.count {
        if s[s.index(s.startIndex, offsetBy: i)] == "-" {
            sign = -1 // Sign is negative
            i += 1
        } else if s[s.index(s.startIndex, offsetBy: i)] == "+" {
            i += 1 // Skip "+"
        }
    }

    // 3.Convert the digits to a number
    while i < s.count {
        guard let digit = Int(String(s[s.index(s.startIndex, offsetBy: i)])) else {
            break // Stop if it's not a number
        }
        // Important: check for overflow before adding the next digit!
        if result > Int32.max / 10 || (result == Int32.max / 10 && digit > 7) { // Overflow check for positive numbers
            return sign == 1 ? Int(Int32.max) : Int(Int32.min) // Return min or max value of Int32
        }
        result = result * 10 + digit // Edding number to result
        i += 1
    }

    // 4. Choosing the sign
    return result * sign
}
