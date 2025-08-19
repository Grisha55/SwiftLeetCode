class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        } 

        var dictS = [Character: Character]()
        var dictT = [Character: Character]()

        for (charS, charT) in zip(s, t) {
            if let dictCharT = dictS[charS], dictCharT != charT {
                return false
            }
            if let dictCharS = dictT[charT], dictCharS != charS {
                return false
            }

            dictS[charS] = charT
            dictT[charT] = charS
        }

        return true
    }
}