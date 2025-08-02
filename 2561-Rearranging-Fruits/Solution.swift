//
// 2561. Rearranging Fruits
// SwiftLeetCode
//

class Solution {
    func minCost(_ basket1: [Int], _ basket2: [Int]) -> Int {
        var freq = [Int: Int]()
        let n = basket1.count
    
        // Считаем общую частоту всех фруктов
        for i in 0..<n {
            freq[basket1[i], default: 0] += 1
            freq[basket2[i], default: 0] += 1
        }
    
        // Проверяем, можно ли распределить фрукты поровну
        for (_, count) in freq {
            if count % 2 != 0 {
                return -1
            }
        }
    
        // Собираем фрукты, которые нужно обменять
        var swapList1 = [Int]()
        var swapList2 = [Int]()
    
        // Создаем копии частотных словарей для каждой корзины
        var freq1 = [Int: Int]()
        var freq2 = [Int: Int]()
    
        for num in basket1 {
            freq1[num, default: 0] += 1
        }
    
        for num in basket2 {
            freq2[num, default: 0] += 1
        }
    
        // Находим избыточные фрукты в каждой корзине
        for (num, count) in freq1 {
            let diff = count - (freq[num]! / 2)
            if diff > 0 {
                for _ in 0..<diff {
                    swapList1.append(num)
                }
            }
        }
    
        for (num, count) in freq2 {
            let diff = count - (freq[num]! / 2)
            if diff > 0 {
                for _ in 0..<diff {
                    swapList2.append(num)
                }
            }
        }
    
        // Сортируем списки для обмена
        swapList1.sort()
        swapList2.sort(by: >)
    
        // Вычисляем минимальную стоимость обмена
        var minCost = 0
        let minGlobal = freq.keys.min()!
    
        for i in 0..<swapList1.count {
            let cost = min(swapList1[i], swapList2[i])
            minCost += min(cost, 2 * minGlobal)
        }
    
        return minCost
    }
}
