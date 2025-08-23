class Solution {
    func minimumSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        // Считаем позиции единиц
        var ones: [(Int, Int)] = []
        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == 1 {
                    ones.append((i, j))
                }
            }
        }
        
        if ones.isEmpty {
            return 0
        }
        
        var answer = Int.max
        
        // Функция считает площадь ограничивающего прямоугольника по множеству точек
        func boundingArea(_ pts: [(Int, Int)]) -> Int {
            if pts.isEmpty { return 0 }
            var minX = Int.max, maxX = Int.min
            var minY = Int.max, maxY = Int.min
            for (x, y) in pts {
                minX = min(minX, x)
                maxX = max(maxX, x)
                minY = min(minY, y)
                maxY = max(maxY, y)
            }
            return (maxX - minX + 1) * (maxY - minY + 1)
        }
        
        // 1) Горизонтальные разрезы: три полосы по строкам
        for i in 0..<n {
            for j in (i+1)..<n {
                var g1: [(Int, Int)] = []
                var g2: [(Int, Int)] = []
                var g3: [(Int, Int)] = []
                for (x, y) in ones {
                    if x <= i {
                        g1.append((x, y))
                    } else if x <= j {
                        g2.append((x, y))
                    } else {
                        g3.append((x, y))
                    }
                }
                if !g1.isEmpty && !g2.isEmpty && !g3.isEmpty {
                    let sum = boundingArea(g1) + boundingArea(g2) + boundingArea(g3)
                    answer = min(answer, sum)
                }
            }
        }
        
        // 2) Вертикальные разрезы: три полосы по столбцам
        for i in 0..<m {
            for j in (i+1)..<m {
                var g1: [(Int, Int)] = []
                var g2: [(Int, Int)] = []
                var g3: [(Int, Int)] = []
                for (x, y) in ones {
                    if y <= i {
                        g1.append((x, y))
                    } else if y <= j {
                        g2.append((x, y))
                    } else {
                        g3.append((x, y))
                    }
                }
                if !g1.isEmpty && !g2.isEmpty && !g3.isEmpty {
                    let sum = boundingArea(g1) + boundingArea(g2) + boundingArea(g3)
                    answer = min(answer, sum)
                }
            }
        }
        
        // 3) Комбинация: один горизонтальный разрез + один вертикальный
        // (т.е. получаем 2x2 = 4 прямоугольника, а нужно 3, значит два можно объединить)
        for rowCut in 0..<n {
            for colCut in 0..<m {
                // Разделяем на 4 зоны
                var g1: [(Int, Int)] = []
                var g2: [(Int, Int)] = []
                var g3: [(Int, Int)] = []
                var g4: [(Int, Int)] = []
                for (x, y) in ones {
                    if x <= rowCut && y <= colCut {
                        g1.append((x, y))
                    } else if x <= rowCut && y > colCut {
                        g2.append((x, y))
                    } else if x > rowCut && y <= colCut {
                        g3.append((x, y))
                    } else {
                        g4.append((x, y))
                    }
                }
                let groups = [g1, g2, g3, g4]
                // Нужно объединить любые два прямоугольника → всего 6 комбинаций
                for a in 0..<4 {
                    for b in (a+1)..<4 {
                        var newGroups: [[(Int, Int)]] = []
                        for k in 0..<4 {
                            if k == a || k == b { continue }
                            newGroups.append(groups[k])
                        }
                        newGroups.append(groups[a] + groups[b]) // объединяем
                        
                        if newGroups.allSatisfy({ !$0.isEmpty }) {
                            let sum = newGroups.map { boundingArea($0) }.reduce(0, +)
                            answer = min(answer, sum)
                        }
                    }
                }
            }
        }
        
        return answer == Int.max ? 0 : answer
    }
}
