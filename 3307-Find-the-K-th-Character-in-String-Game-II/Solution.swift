//
// 3307. Find the K-th Character in String Game II
// SwiftLeetCode
//

class Solution {
    func kthCharacter(_ k: Int, _ operations: [Int]) -> Character {
        var ans = 0
        var curK = k

        while curK != 1 {
            let t = Int(log2(Double(curK)))
            let power = 1 << t

            // Check if curK is exactly a power of 2
            if power == curK {
                curK -= power / 2
                if t > 0 && operations[t - 1] == 1 {
                    ans += 1
                }
            } else {
                curK -= power
                if operations[t] == 1 {
                    ans += 1
                }
            }
        }

        // Calculate the final character
        let charCode = UnicodeScalar("a").value + UInt32(ans % 26)
        return Character(UnicodeScalar(charCode)!)
    }
}

/*
Explanation:
    1. Initialization:
        - ans keeps track of how many "increment" operations affect the final character
        - currentK is a mutable copy of the input k

    2. Main Loop:
        - The loop continues until currentK becomes 1
        - t calculates the largest power of 2 less than or equal to currentK
        - power is 2 raised to the power of t

    3. Power of 2 Check:
        - If currentK is exactly a power of 2, we:
            - Subtract half of that power
            - Check if the operation at position t-1 was an increment (1)

    4. Non-Power of 2 Case:
        - Subtract the largest power of 2 from currentK
        - Check if the operation at position t was an increment (1)

    5. Final Character Calculation:
        - The result is calculated by taking the ASCII code of "a" and adding ans % 26
        - This handles the circular nature of the alphabet (z → a)
*/
