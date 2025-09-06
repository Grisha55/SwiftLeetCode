class Solution {
    func minOperations(_ queries: [[Int]]) -> Int {
         var total = 0

         for query in queries {
            let l = query[0]
            let r = query[1]
            let s = stepsSum(l: l, r: r)
            let operations = (s + 1) / 2
            total += operations
         }

         return total
    }

    private func stepsCount(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }

        var k = 1
        var bound = 1

        while bound * 4 <= x {
            bound *= 4
            k += 1
        }

        return k
    }

    private func stepsSum(l: Int, r: Int) -> Int {
        if l > r {
            return 0
        }

        var total = 0
        var current = l

        while current <= r {
            let k = stepsCount(current)
            let lowerBound = k > 0 ? (1 << (2 * (k - 1))) : 0
            let upperBound = k > 0 ? (1 << (2 * k)) - 1 : 0
            let high = min(r, upperBound)
            let count = high - current + 1
            total += count * k
            current = high + 1
        }

        return total
    }
}