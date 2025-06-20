//
// 0083. Remove Dubplicates from Sorted List
// Problem: https://leetcode.com/problems/remove-duplicates-from-sorted-list/
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head

        while current != nil && current?.next != nil {
            if current!.val == current?.next!.val {
                current!.next = current!.next!.next
            } else {
                current = current!.next
            }
        }
        return head
    }
}
