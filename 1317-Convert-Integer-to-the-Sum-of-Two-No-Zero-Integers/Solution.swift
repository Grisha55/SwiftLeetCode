class Solution {
    func getNoZeroIntegers(_ n: Int) -> [Int] {
        
        for i in 1..<n {
            if i % 10 != 0  && n - i % 10 != 0 && !(String(i).contains("0")) && !(String(n - i).contains("0")) {
                if i + (n - i) == n {
                    return [i, n - i]
                }
            }
        }

        return []
    }
}
