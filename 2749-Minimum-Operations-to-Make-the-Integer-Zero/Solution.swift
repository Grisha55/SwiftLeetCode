class Solution {
    func makeTheIntegerZero(_ num1: Int, _ num2: Int) -> Int {
        
        for i in 0..<10000 {
            let res = num1 - i * num2
            
            if res < 0 {
                continue
            }

            if res == 0 {
                if i == 0 {
                    return 0
                }
                continue
            }

            if i > res {
                continue
            } 

            let popcount = res.nonzeroBitCount
            if i < popcount {
                continue
            }

            return i
        }

        return -1
    }
}