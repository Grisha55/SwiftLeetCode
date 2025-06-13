// 0007-Reverse-Integer
// Problem: https://leetcode.com/problems/reverse-integer/

import Foundation

func reverse(_ x: Int) -> Int {
    var num = x
    var finalNum = 0
    while num > 0 {
        finalNum *= 10
        finalNum += num % 10
        num /= 10
    }
    if num > 0 {
        if finalNum <= Int32.min || finalNum >= Int32.max {
            return 0
        }
        return finalNum
    } else {
        while num < 0 {
            finalNum *= 10
            finalNum += num % 10
            num /= 10
        }
        if finalNum <= Int32.min || finalNum >= Int32.max {
            return 0
        }
        return finalNum
    }
    
}
