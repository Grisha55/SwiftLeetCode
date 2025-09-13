class Solution {
    func maxFreqSum(_ s: String) -> Int {
        if s.count == 0 { return 0 }
        let vowels = "aeiou"

        var vowelsDict = [Character: Int]()
        var consonantDict = [Character: Int]()
        var consonantMax = 0
        var vowelsMax = 0

        for char in s {
            if vowels.contains(char) {
                vowelsDict[char, default: 0] += 1
            } else {
                consonantDict[char, default: 0] += 1
            }
        }

        for char in s {
            if vowels.contains(char) {
                let count = vowelsDict[char]!
                vowelsMax = max(vowelsMax, count)
            } else {
                let count = consonantDict[char]!
                consonantMax = max(consonantMax, count)
            }
        }

        return vowelsMax + consonantMax
    }
}