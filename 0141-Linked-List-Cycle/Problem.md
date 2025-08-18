# 0141. Linked List Cycle

## Description

Given head, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

Return true if there is a cycle in the linked list. Otherwise, return false.

## Example

**Input:**
head = [3,2,0,-4], pos = 1
<br>
**Output:**
<br>
true
<br>
**Explanation:**
<br>
There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).

## Constraints

- The number of the nodes in the list is in the range `[0, 10^4]`.
- `-10^5 <= Node.val <= 10^5`
- `pos` is `-1` or a valid index in the linked-list.
