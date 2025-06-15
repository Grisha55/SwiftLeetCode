//
// 0028. Find the Index of the First Occurrence in a String
// Problem: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/
// SwiftLeetCode

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
    let h = Array(haystack)
    let n = Array(needle)
    let hLen = h.count
    let nLen = n.count

    if nLen == 0 { return 0 }

    // Шаг 1: Create array LPS (Longest Proper Prefix Suffix)
    var lps = Array(repeating: 0, count: nLen)
    var len = 0
    var i = 1
    while i < nLen {
        if n[i] == n[len] {
            len += 1
            lps[i] = len
            i += 1
        } else {
            if len != 0 {
                len = lps[len - 1]
            } else {
                lps[i] = 0
                i += 1
            }
        }
    }

        // Шаг 2: Search in KMP
        var hi = 0  // index in haystack
        var ni = 0  // index in needle

        while hi < hLen {
            if h[hi] == n[ni] {
                hi += 1
                ni += 1
            }

            if ni == nLen {
                return hi - ni  // substring was found
            } else if hi < hLen && h[hi] != n[ni] {
                if ni != 0 {
                    ni = lps[ni - 1]  // go back from lps
                } else {
                    hi += 1
                }
            }
        }

        return -1
    }

}
