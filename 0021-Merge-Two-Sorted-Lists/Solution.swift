//
// 0021. Merge Two Sorted Lists
// Problem: https://leetcode.com/problems/merge-two-sorted-lists/
// SwiftLeetCode
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var head = ListNode(-1)
        var link = head
        var ls1 = list1
        var ls2 = list2

        while ls1 != nil && ls2 != nil {
            if ls1!.val < ls2!.val {
                link.next = ls1
                ls1 = ls1!.next
            } else {
                link.next = ls2
                ls2 = ls2!.next
            }
            link = link.next!
        }
        if ls1 != nil {
            link.next = ls1
        } else {
            link.next = ls2
        }
        return head.next
    }
}
