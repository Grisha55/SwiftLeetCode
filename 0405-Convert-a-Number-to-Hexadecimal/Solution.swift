class Solution {
    func toHex(_ num: Int) -> String {
        if num == 0 { return "0" }
        let hexValues = "0123456789abcdef"
        var res = ""
        var numCopy = UInt32(truncatingIfNeeded: num)

        while numCopy > 0 {
            let value = Int(numCopy % 16)
            res = String(hexValues[hexValues.index(hexValues.startIndex, offsetBy: value)]) + res
            numCopy /= 16
        }

        return res
    }
}