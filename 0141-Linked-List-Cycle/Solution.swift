/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var first = head
        var second = head

        while second != nil && first?.next != nil {
            first = first?.next
            second = second?.next?.next

            if first === second {
                return true
            }
        }

        return false
    }
}