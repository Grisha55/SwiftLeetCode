//
// 1290. Convert Binary Number in a Linked List to Integer
// SwiftLeetCode
//

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
    func getDecimalValue(_ head: ListNode?) -> Int {
        var decimal = 0
        var current = head

        while current != nil {
            decimal = decimal * 2 + current!.val
            current = current?.next
        }

        return decimal
    }
}

/*
Time complexity:
O(n), n - number of nodes in list

Space complexity:
O(1)
*/
