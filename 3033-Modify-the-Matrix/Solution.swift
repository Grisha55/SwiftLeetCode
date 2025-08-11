class Solution {
    func modifiedMatrix(_ matrix: [[Int]]) -> [[Int]] {
        var matrix = matrix
        let rows = matrix.count
        let cols = matrix[0].count

        for j in 0..<cols {
            var m = Int.min
            for i in 0..<rows {
                if matrix[i][j] != -1 {
                    m = max(m, matrix[i][j])
                }
            }

            for i in 0..<rows {
                if matrix[i][j] == -1 {
                    matrix[i][j] = m
                }
            }
        }

        return matrix
    }
}