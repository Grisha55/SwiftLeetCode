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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var head = head
        var nodes = [Int?]()

        while head != nil {
            nodes.append(head?.val)
            head = head?.next
        }

        for i in 0..<nodes.count {
            if nodes[i] != nodes[nodes.count - i - 1] {
                return false
            }
        }

        return true
    }
}