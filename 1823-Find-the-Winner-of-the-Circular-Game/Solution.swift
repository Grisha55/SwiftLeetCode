class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var friends = [Int]()

        for i in 0..<n {
            friends.append(i)
        }

        var currIndex = 0
        while friends.count > 1 {
            currIndex = (currIndex + k - 1) % friends.count
            friends.remove(at: currIndex)
        }

        return friends[0] + 1
    }
}