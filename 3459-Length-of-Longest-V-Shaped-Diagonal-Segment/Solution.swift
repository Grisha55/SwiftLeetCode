class Solution {
    func lenOfVDiagonal(_ grid: [[Int]]) -> Int {
        let directions = [
            (1, 1),
            (-1, 1),
            (1, -1),
            (-1, -1)
        ]

        let turn = [2, 0, 3, 1]
        let m = grid.count
        let n = grid[0].count
        var maxLength = 0

        func dfs(_ x: Int, _ y: Int, _ dir: Int, _ idx: Int, _ turned: Bool) -> Int {
            if x < 0 || x >= m || y < 0 || y >= n {
                return 0
            }
            let expected = idx == 0 ? 1 : (idx % 2 == 1 ? 2 : 0)

            if grid[x][y] != expected {
                return 0
            }

            var res = 1
            res = max(res, 1 + dfs(x + directions[dir].0, y + directions[dir].1, dir, idx + 1, turned))
            if !turned {
                let newDir = turn[dir]
                res = max(res, 1 + dfs(x + directions[newDir].0, y + directions[newDir].1, newDir, idx + 1, true))
            }
            
            return res
        }

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    for dir in 0..<4 {
                        maxLength = max(maxLength, dfs(i, j, dir, 0, false))
                    }
                }
            }
        }

        return maxLength
    }
}