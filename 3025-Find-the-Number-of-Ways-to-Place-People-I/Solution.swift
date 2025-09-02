class Solution {
    func numberOfPairs(_ points: [[Int]]) -> Int {
        let n = points.count
        
        if n < 1 {
            return 0
        }

        let sortedPoints = points.sorted {
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            }
            return $0[0] < $1[0]
        }

        var count = 0

        for i in 0..<n {
            let curY = sortedPoints[i][1]
            var maxFarY = Int.min

            for j in (i + 1)..<n {
                if sortedPoints[j][1] <= curY {
                    if sortedPoints[j][1] > maxFarY {
                        count += 1
                        maxFarY = sortedPoints[j][1]
                    }
                }
            }
        }

        return count
    }
}