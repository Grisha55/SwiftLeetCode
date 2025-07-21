//
// 1957. Delete Characters to Make Fancy String
// SwiftLeetCode
//

class Solution {
    func makeFancyString(_ s: String) -> String {
        var res = [Character]()

        for c in s {
            if res.count >= 2 && res[res.count - 1] == c && res[res.count - 2] == c {
                continue
            }
            res.append(c)
        }

        return String(res)
    }
}

/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
