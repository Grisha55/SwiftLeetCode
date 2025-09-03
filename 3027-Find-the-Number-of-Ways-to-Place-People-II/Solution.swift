class Solution {
    func numberOfPairs(_ points: [[Int]]) -> Int {
        let n = points.count
        var count = 0

        let sortedPoints = points.sorted {
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            }
            return $0[0] < $1[0]
        }

        for i in 0..<n {
            let alice = sortedPoints[i]

            for j in (i + 1)..<n {
                let bob = sortedPoints[j]

                if bob[0] >= alice[0] && bob[1] <= alice[1] {
                    var hasPointInside = true
                    var minY = bob[1]
                    var maxY = alice[1]

                    for k in (i + 1)..<j {
                        let point = sortedPoints[k]
                        if point[1] <= alice[1] && point[1] >= bob[1] {
                            hasPointInside = false
                            break
                        }
                    }
                    if hasPointInside {
                        count += 1
                    }
                }
            }
        }

        return count
    }
}