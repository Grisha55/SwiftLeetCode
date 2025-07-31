//
// 0898. Bitwise ORs of Subarrays
// SwiftLeetCode
// Time Complexity - O(n * k); k - current.count
// Space Complexity - O(n)

class Solution {
    func subarrayBitwiseORs(_ arr: [Int]) -> Int {
        // Множество для хранения уникальных результатов побитового OR
        var result = Set<Int>()
        // Текущий набор значений OR для подмассивов, заканчивающихся на предыдущем элементе
        var current = Set<Int>()

        for num in arr {
            // Временный набор для хранения новых значений OR с текущим числом
            var temp = Set<Int>()
            // Добавляем само число как подмассив из одного элемента
            temp.insert(num)

            // Объединяем текущее число со всеми предыдущими результатами
            for val in current {
                temp.insert(val | num)
            }

            // Обновляем текущий набор и добавляем все значения в итоговый результат
            current = temp
            result.formUnion(current)
        }

        return result.count
    }
}
