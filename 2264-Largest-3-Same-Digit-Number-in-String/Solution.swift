class Solution {
    func largestGoodInteger(_ num: String) -> String {
        var arr = Array(num)
        var number = -1

        for i in 1..<arr.count {
            if i + 1 < arr.count && arr[i - 1] == arr[i] && arr[i + 1] == arr[i] {
                let firstNum = arr[i - 1]
                let second = arr[i]
                let third = arr[i + 1]
                let fullNum = String(firstNum) + String(second) + String(third)
                number = max(number, Int(fullNum)!)
            }
        }

        if number == -1 {
            return ""
        }

        if number == 0 {
            return "000"
        }

        return String(number)
    }
}