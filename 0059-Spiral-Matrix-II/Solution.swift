class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
        var l = 0
        var r = n - 1
        var t = 0
        var b = n - 1
        var num = 1

        while l <= r && t <= b {
            // top row
            if l <= r && t <= b {
                for i in l...r {
                    matrix[t][i] = num
                    num += 1
                }
                t += 1
            }

            // right column
            if t <= b && l <= r {
                for i in t...b {
                    matrix[i][r] = num
                    num += 1
                }
                r -= 1
            }

            // bttom row
            if l <= r && t <= b {
                for i in stride(from: r, through: l, by: -1) {
                    matrix[b][i] = num
                    num += 1
                }
                b -= 1
            }

            // left column
            if t <= b && l <= r {
                for i in stride(from: b, through: t, by: -1) {
                    matrix[i][l] = num
                    num += 1
                }
                l += 1
            }
        }

        return matrix
    }
}