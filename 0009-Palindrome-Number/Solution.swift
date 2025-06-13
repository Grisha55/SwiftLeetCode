// 0009-Palindrome-Number
// Problem: https://leetcode.com/problems/palindrome-number/

func isPalindrome(_ x: Int) -> Bool {
    var input = x
    var resultInput = 0
    
    while input > 0 {
        resultInput *= 10
        resultInput += input % 10
        input /= 10
    }
    if resultInput == x { return true }
    return false
}
