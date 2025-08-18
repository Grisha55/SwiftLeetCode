class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        let n = dominoes.count
        var dominoArray = Array(dominoes)
        var netForce = Array(repeating: 0, count: n)
        var left = 0
        var right = 0

        // Left to right: apply righward forces
        for index in 0..<n {
            if dominoArray[index] == "R" {
                right = n
            } else if dominoArray[index] == "L" {
                right = 0
            } else if right > 0 {
                right -= 1
            }
            netForce[index] += right
        }

        // Right to left: apply leftward forces
        for index in (0..<n).reversed() {
            if dominoArray[index] == "L" {
                left = n
            } else if dominoArray[index] == "R" {
                left = 0
            } else if left > 0 {
                left -= 1
            }
            netForce[index] -= left
        }

        // Build result
        for index in 0..<n {
            if netForce[index] > 0 {
                dominoArray[index] = "R"
            } else if netForce[index] < 0 {
                dominoArray[index] = "L"
            } else {
                dominoArray[index] = "."
            }
        }

        return String(dominoArray)
    }
}