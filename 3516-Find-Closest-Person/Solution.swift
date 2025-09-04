class Solution {
    func findClosest(_ x: Int, _ y: Int, _ z: Int) -> Int {
        let lengthX = abs(z - x)
        let lengthY = abs(z - y)

        if lengthX < lengthY {
            return 1
        }
        if lengthX > lengthY {
            return 2
        }

        return 0
    }
}