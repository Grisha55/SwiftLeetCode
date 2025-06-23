//
// 2081. Sum of k-Mirror Numbers
// Problem: https://leetcode.com/problems/sum-of-k-mirror-numbers/description/?envType=daily-question&envId=2025-06-23
// SwiftLeetCode
//

import Foundation

class Solution {
    // Temporary array to store digits of number in base-k (up to 100 digits)
    var tempDigits = [Int](repeating: 0, count: 100)
    
    func kMirror(_ base: Int, _ targetCount: Int) -> Int {
        // Closure to check if a number is a palindrome in base-k
        let isKPalindrome: (Int) -> Bool = { number in
            var num = number
            var len = -1
            
            // Convert the number to base-k and store digits in reverse order
            while num > 0 {
                len += 1
                self.tempDigits[len] = num % base
                num /= base
            }
            
            var i = 0
            var j = len
            // Check if digits form a palindrome
            while i < j {
                if self.tempDigits[i] != self.tempDigits[j] {
                    return false
                }
                i += 1
                j -= 1
            }
            return true
        }
        
        var currentLeft = 1          // Lower bound of the half-part of the decimal palindrome
        var foundCount = 0           // Number of valid k-mirror numbers found
        var totalSum = 0             // Sum of k-mirror numbers

        // Continue searching until we've found the required amount
        while foundCount < targetCount {
            let currentRight = currentLeft * 10   // Upper bound of the current range for half-parts

            // mode = 0 → odd-length palindromes
            // mode = 1 → even-length palindromes
            for mode in 0..<2 {
                // Iterate through all half-parts within the current range
                for half in currentLeft..<currentRight where foundCount < targetCount {
                    var palin = half                          // Start with the first half
                    var suffix = (mode == 0) ? half / 10 : half  // Determine suffix for mirroring

                    // Mirror the suffix to create the full palindrome
                    while suffix > 0 {
                        palin = palin * 10 + (suffix % 10)   // Append mirrored digit
                        suffix /= 10
                    }

                    // Check if the resulting number is a k-palindrome
                    if isKPalindrome(palin) {
                        totalSum += palin     // Add to sum
                        foundCount += 1       // Increase the count

                        // Stop early if we have enough
                        if foundCount == targetCount {
                            break
                        }
                    }
                }
            }

            currentLeft = currentRight    // Move to the next range of half-parts
        }

        return totalSum  // Return the total sum of the k-mirror numbers
    }
}

