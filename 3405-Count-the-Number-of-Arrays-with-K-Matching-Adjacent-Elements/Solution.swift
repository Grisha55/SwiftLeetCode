//
// 3405. Count the Number of Arrays with K Matching Adjacent Elements
// SwiftLeetCode
//

import Foundation

class Solution {
    func countGoodArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {

        // Auxiliary variables:
        let MOD = 1_000_000_007 // is the number by which the remainder (modulo) is taken to avoid overflow of numbers.
        let MX = 100_000        // maximum size for factorials (for combinatorics).

        // Factorials and inverse factorials:
        var fact = [Int](repeating: 1, count: MX)      // is the factorial of the number i (i!).
        var inv_fact = [Int](repeating: 1, count: MX)  // inverse factorial modulo (1 / i! mod MOD).

        // Fast Elevation to Degree:
        func qpow(_ x: Int, _ n: Int) -> Int {
            var res = 1
            var x = x % MOD
            var n = n

            while n > 0 {
                if n % 2 == 1 {
                    res = (res * x) % MOD
                }
                x = (x * x) % MOD
                n /= 2
            }
            return res
        }

        // Formula combinations: C(n, m) = n! / (m! * (n - m)!)
        func comb(_ n: Int, _ m: Int) -> Int {
            return (fact[n] * inv_fact[m] % MOD) * inv_fact[n - m] % MOD // the factorials are taken modulo.
        }

        // Preparing factorials:
        func initFactorials() {
            if fact[0] != 1 { // Checking for an already initialized array
                return
            }
            fact[0] = 1
            for i in 1..<MX {
                fact[i] = (fact[i - 1] * i) % MOD
            }

            inv_fact[MX - 1] = qpow(fact[MX - 1], MOD - 2)
            for i in stride(from: MX - 2, through: 0, by: -1) {
                inv_fact[i] = (inv_fact[i + 1] * (i + 1)) % MOD
            }
        }

        initFactorials()
        return (comb(n - 1, k) * m % MOD) * qpow(m - 1, n - k - 1) % MOD

        /*
            Explanation:

                1. We choose k places where there will be equal elements is C(n-1, k) ways.
                    Why n-1? Because there are only n-1 pairs of neighboring elements.

                2. We choose a number for the beginning of the array - m ways.

                3. For the remaining locations (where the elements are NOT equal to the previous ones) - we have n - 1 - k      such                 locations. Each can be anything but the previous → m - 1 variants.

                Therefore: qpow(m - 1, n - k - 1)
        */
    }
}
