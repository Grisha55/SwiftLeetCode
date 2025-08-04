//
// 0904. Fruit Into Baskets
// SwiftLeetCode
//

class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var maxFruits = 0
        var basket = [Int: Int]() // Хранит тип фрукта и его последний индекс
        var left = 0

        for right in 0..<fruits.count {
            let currentFruit = fruits[right]
            basket[currentFruit] = right // Обновляем последний индекс для текущего фрукта

            // Если в корзине больше 2 типов фруктов
            if basket.count > 2 {
                // Находим фрукт с самым левым последним индексом
                let minIndex = basket.values.min()!
                // Удаляем этот фрукт из корзины
                basket = basket.filter { $0.value != minIndex }
                // Сдвигаем левую границу окна
                left = minIndex + 1
            }

            // Обновляем максимальное кол-во фруктов
            maxFruits = max(maxFruits, right - left + 1)
        }

        return maxFruits
    }
}

/*
Time Complexity - O(n)
Space Complexity - O(1)
*/
