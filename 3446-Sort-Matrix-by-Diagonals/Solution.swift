class Solution {
    func sortMatrix(_ grid: [[Int]]) -> [[Int]] {
        var grid = grid
        let n = grid.count
        
        // нижний левый треугольник + главная диагональ
        for i in 0..<n {
            var tmp = [Int]()
            var j = 0
            while i + j < n {
                tmp.append(grid[i + j][j])
                j += 1
            }
            tmp.sort(by: >) // по убыванию
            j = 0
            var k = 0
            while i + j < n {
                grid[i + j][j] = tmp[k]
                j += 1
                k += 1
            }
        }
        
        // верхний правый треугольник
        for j in 1..<n {
            var tmp = [Int]()
            var i = 0
            while j + i < n {
                tmp.append(grid[i][j + i])
                i += 1
            }
            tmp.sort() // по возрастанию
            i = 0
            var k = 0
            while j + i < n {
                grid[i][j + i] = tmp[k]
                i += 1
                k += 1
            }
        }
        
        return grid
    }
}
