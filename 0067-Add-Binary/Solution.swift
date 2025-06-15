//
//  0067. Add Binary
//  Problem: https://leetcode.com/problems/add-binary/
//  SwiftLeetCode
//

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = Array(a)
        var b = Array(b)
        var i = a.count - 1
        var j = b.count - 1
        var carry = 0
        var result = ""

        while i >= 0 || j >= 0 || carry > 0 {
            let bitA = i >= 0 ? Int(String(a[i]))! : 0
            let bitB = j >= 0 ? Int(String(b[j]))! : 0

            let sum = bitA + bitB + carry
            result = String(sum % 2) + result
            carry = sum / 2

            i -= 1
            j -= 1
        }
        
        return result
    }
}
