class Solution {
    func possibleStringCount(_ word: String) -> Int {
        let chars = Array(word)
        let n = chars.count
        var i = 0
        var repeatGroups = 0

        while i < n {
            var j = i
            // Move 'j' forward while the characters are the same
            while j < n && chars[j] == chars[i] {
                j += 1
            }
            let groupLen = j - i
            if groupLen > 1 {
                // Each group of length L gives (L - 1) compression options
                repeatGroups += groupLen - 1
            }
            i = j
        }

        // We can either compress one group (in multiple ways),
        // or leave everything as-is
        return repeatGroups + 1
    }
}
