//
// 0076. Minimum Window Substring
// Problem: https://leetcode.com/problems/minimum-window-substring/
// SwiftLeetCode
//

import Foundation

func minWindow(_ s: String, _ t: String) -> String {
    let sArr = Array(s)
    let tArr = Array(t)
    
    var need = [Character: Int]()
    
    // Count how many times each character from t must occur.
    // Example: if t = “AABC”, then need = [“A”: 2, ‘B’: 1, “C”: 1]
    for ch in tArr {
        need[ch, default: 0] += 1
    }
    
    // We use a “sliding window”, which is a technique where we move two pointers (left and right)
    // along a line to find the desired segment.
    var window = [Character: Int]() // current characters in the window
    var left = 0, right = 0         // window borders
    var valid = 0                   // how many characters have already matched the required number
    
    var start = 0
    var minLen = Int.max
    
    // Expanding the window to the right
    while right < sArr.count {
        let c = sArr[right]
        right += 1 // Add a symbol to the right end of the window.
        
        // If we need this symbol (it is in need):
        if need.keys.contains(c) {
            window[c, default: 0] += 1 // We increase the window counter.
            if window[c] == need[c] {  // if we get the right amount, valid increases.
                valid += 1
            }
        }
        
        // Shrink the window on the left (if all characters are found)
        while valid == need.count {
            // If we have found a suitable window and it is shorter than the current minimum, we update start and minLen.
            if right - left < minLen {
                start = left
                minLen = right - left
            }
            
            // Remove the symbol from the left side of the window
            let d = sArr[left]
            left += 1
            
            // We decrease the number of characters in the window,
            // and if we have deleted an important character, the window decreases -
            // it means that the window is no longer suitable.
            if need.keys.contains(d) {
                if window[d] == need[d] {
                    valid -= 1
                }
                window[d]! -= 1
            }
        }
    }
    
    // If no suitable window was found, return “”.
    // Otherwise, return the shortest substring that contains all the required characters.
    return minLen == Int.max ? "" : String(sArr[start..<start + minLen])
}
