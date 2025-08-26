class Solution {
    func areaOfMaxDiagonal(_ dimensions: [[Int]]) -> Int {
        var maxLength = 0
        var maxDiagonal = 0

        for arr in dimensions {
            let first = arr[0]
            let second = arr[1]
            let diagonal = first * first + second * second
            let length = first * second

            if maxDiagonal < diagonal {
                maxDiagonal = diagonal
                maxLength = length
            } else if diagonal == maxDiagonal {
                if maxLength < length {
                    maxLength = length
                }
            }
        }

        return maxLength
    }
}
