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

import Foundation

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummyHead = ListNode(0)
    var current = dummyHead
    var p = l1
    var q = l2
    var carry = 0
    
    while p != nil || q != nil || carry != 0 {
        let x = p?.val ?? 0
        let y = q?.val ?? 0
        let sum = x + y + carry
        
        carry = sum / 10
        current.next = ListNode(sum % 10)
        current = current.next!
        p = p?.next
        q = q?.next
    }
    
    return dummyHead.next
}
