class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA
        var b = headB

        while a !== b {

            if a == nil {
                a = headB
            } else {
                a = a?.next
            }

            if b == nil {
                b = headA
            } else {
                b = b?.next
            }
        }

        return a
    }
}

/*
4. Магия в цифрах
Пусть:
  - длина A = m
  - длина B = n

длина хвоста (общей части) = c

Тогда:
  - Первый указатель проходит: (m) + (n - c) шагов до встречи.
  - Второй проходит: (n) + (m - c) шагов до встречи.

А (m) + (n - c) = (n) + (m - c) — они равны.
В итоге встреча всегда произойдёт в точке пересечения или оба будут nil.
*/