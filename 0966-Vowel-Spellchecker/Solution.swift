class Solution {
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        var exactMatch = Set<String>()
        var lowercase = [String: String]()
        var devoweled = [String: String]()

        for word in wordlist {
            exactMatch.insert(word)

            let lower = word.lowercased()
            if lowercase[lower] == nil {
                lowercase[lower] = word
            }

            let devowel = devowel(word.lowercased())
            if devoweled[devowel] == nil {
                devoweled[devowel] = word
            }
        }

        var result = [String]()
        for query in queries {
            if exactMatch.contains(query) {
                result.append(query)
                continue
            }

            let lowerQuery = query.lowercased()
            if let match = lowercase[lowerQuery] {
                result.append(match)
                continue
            }

            let devowelQuery = devowel(lowerQuery)
            if let match = devoweled[devowelQuery] {
                result.append(match)
                continue
            }

            result.append("")
        }

        return result
    }

    private func devowel(_ word: String) -> String {
        var result = ""
        for char in word {
            switch char {
                case "a", "e", "i", "o", "u":
                    result.append("*")
                default: 
                    result.append(char)
            }
        }

        return result
    }
}