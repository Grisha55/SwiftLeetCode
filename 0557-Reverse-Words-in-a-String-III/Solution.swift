class Solution {
    func reverseWords(_ s: String) -> String {
        let wordsArr = s.split(separator: " ")
        var res = ""

        for i in 0..<wordsArr.count {
            if i > 0 && i < wordsArr.count {
                res += " " + wordsArr[i].reversed()
            } else {
                res += wordsArr[i].reversed()
            }
        }

        return res
    }
}