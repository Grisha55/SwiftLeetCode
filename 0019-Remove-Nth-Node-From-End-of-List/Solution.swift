class Solution {
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var dummy = ListNode(0)
    dummy.next = head
    var first: ListNode? = dummy
    var second: ListNode? = dummy

    // Move first pointer n+1 steps ahead
    for _ in 0...n {
      first = first?.next
    }

    // Move both pointers until first reaches the end
    while first != nil {
      first = first?.next
      second = second?.next
    }

    // Remove the nth node from the end
    second?.next = second?.next?.next

    return dummy.next
  }
}