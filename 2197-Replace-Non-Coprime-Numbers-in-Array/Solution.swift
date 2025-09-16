class Solution {
    func replaceNonCoprimes(_ nums: [Int]) -> [Int] {
        var stack = [Int]()

        for num in nums {
            var cur = num

            while !stack.isEmpty {
                let last = stack.last!
                let gcd = findGCD(last, cur)
                if gcd > 1 {
                    let lcm = last * cur / gcd
                    stack.removeLast()
                    cur = lcm
                } else {
                    break
                }
            }

            stack.append(cur)
        }

        return stack
    }

    private func findGCD(_ x: Int, _ y: Int) -> Int {
        var a = x
        var b = y

        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }

        return a
    }
}