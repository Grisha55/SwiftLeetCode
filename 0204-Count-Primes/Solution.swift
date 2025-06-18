//
// 0204. Count Primes
// Problem: https://leetcode.com/problems/count-primes/
// SwiftLeetCode
//

import Foundation

class Solution {
    
    // Algorithm: Sieve of Eratosthenes
    // This is a clever way to quickly find all prime numbers up to n, excluding all composite (non-prime) numbers.

    func countPrimes(_ n: Int) -> Int {
        if n <= 2 { return 0 } // If n is less than or equal to 2, then there are no prime numbers (since prime numbers start with 2).
        // Create an array primes of n true values.
        // Each cell will indicate whether the index is a prime number.
        var primes = [Bool](repeating: true, count: n)

        primes[0] = false // 0 -> isn't prime number
        primes[1] = false // 1 -> isn't prime number

        // We start the cycle from 2 to the square root of n.
        // Why to √n? Because any composite number has a divisor ≤ √n.
        for i in 2...Int(sqrt(Double(n))) + 1 {

            // If i is still considered prime, then:
            if primes[i] {

                // We start excluding all multiples of i (starting with i*i)
                var j = i * i
                while j < n {

                    // We skip i*2, i*3, ..., because they were already excluded by the previous loops.
                    // We mark them as false, i.e. they are not simple.
                    primes[j] = false
                    j += i
                }
            }
        }

        // At the end, we count how many trues are left in the primes array - this is the number of prime numbers less than n.
        return primes.filter { $0 }.count
    }
}
