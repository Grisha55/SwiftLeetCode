class Solution {
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        let brokenSet = Set(brokenLetters)
        var textArr = text.components(separatedBy: " ")
        var count = 0
        
        for str in textArr {
            var contains = true
            
            for char in str {
                if brokenSet.contains(char) {
                    contains = false
                    break
                }
            }

            if contains {
                count += 1
            }
        }

        return count
    }
}