class Solution {
    func sortVowels(_ s: String) -> String {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

        var vowelsArr: [Character] = []

        for char in s {
            if vowels.contains(char) {
                vowelsArr.append(char)
            }
        }

        vowelsArr.sort()

        var idx = 0
        var result = ""

        for char in s {
            if vowels.contains(char) {
                result.append(vowelsArr[idx])
                idx += 1
            } else {
                result.append(char)
            }
        }

        return result
    }
}