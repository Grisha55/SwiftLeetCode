# 0155. Min Stack

## Description

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

Implement the `MinStack` class:

- `MinStack()` initializes the stack object.
- `void push(int val)` pushes the element `val` onto the stack.
- `void pop()` removes the element on the top of the stack.
- `int top()` gets the top element of the stack.
- `int getMin()` retrieves the minimum element in the stack.
<br>
You must implement a solution with `O(1)` time complexity for each function.

## Example

**Input:**  
<br>
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]
<br>
**Output:**
<br>
[null,null,null,null,-3,null,0,-2]
<br>
**Explanation:**
<br>
MinStack minStack = new MinStack();
<br>
minStack.push(-2);
<br>
minStack.push(0);
<br>
minStack.push(-3);
<br>
minStack.getMin(); // return -3
<br>
minStack.pop();
<br>
minStack.top();    // return 0
<br>
minStack.getMin(); // return -2

## Constraints

- `-2^31 <= val <= 2^31 - 1`
- Methods `pop`, `top` and `getMin` operations will always be called on **non-empty** stacks.
- At most `3 * 10^4` calls will be made to `push`, `pop`, `top`, and `getMin`.

