class Solution {
    func minimumTeachings(_ n: Int, _ languages: [[Int]], _ friendships: [[Int]]) -> Int {
        let m = languages.count

        var userLanguages = [Int: Set<Int>]()

        for i in 0..<m {
            userLanguages[i + 1] = Set(languages[i])
        }

        var needHelp = [[Int]]()

        for friendship in friendships {
            let u = friendship[0]
            let v = friendship[1]

            if userLanguages[u]!.intersection(userLanguages[v]!).isEmpty {
                needHelp.append(friendship)
            }
        }

        if needHelp.isEmpty {
            return 0
        }

        var minUsers = Int.max

        for language in 1...n {
            var taughtUsers = Set<Int>()

            for friendship in needHelp {
                let u = friendship[0]
                let v = friendship[1]

                if !userLanguages[u]!.contains(language) {
                    taughtUsers.insert(u)
                }

                if !userLanguages[v]!.contains(language) {
                    taughtUsers.insert(v)
                }
            }

            minUsers = min(minUsers, taughtUsers.count)
        }

        return minUsers
    }
}