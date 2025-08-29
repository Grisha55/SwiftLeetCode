class Solution {
    func flowerGame(_ n: Int, _ m: Int) -> Int {
        let evenN = n / 2
        let evenM = m / 2
        let oddN = (n + 1) / 2
        let oddM = (m + 1) / 2

        return evenN * oddM + oddN * evenM
    }
}