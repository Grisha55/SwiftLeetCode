//
// 0018. 4Sum
// SwiftLeetCode
//

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        let sortedNums = nums.sorted()
        let n = sortedNums.count
        var answer = [[Int]]()
        
        for i in 0..<n-3 {
            // Пропускаем дубликаты для первого числа
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            
            // Проверка минимально возможной суммы для текущего i
            let minSum1 = sortedNums[i] + sortedNums[i+1] + sortedNums[i+2] + sortedNums[i+3]
            if minSum1 > target {
                break
            }
            
            // Проверка максимально возможной суммы для текущего i
            let maxSum1 = sortedNums[i] + sortedNums[n-3] + sortedNums[n-2] + sortedNums[n-1]
            if maxSum1 < target {
                continue
            }
            
            for j in i+1..<n-2 {
                // Пропускаем дубликаты для второго числа
                if j > i+1 && sortedNums[j] == sortedNums[j-1] {
                    continue
                }
                
                // Проверка минимально возможной суммы для текущих i и j
                let minSum2 = sortedNums[i] + sortedNums[j] + sortedNums[j+1] + sortedNums[j+2]
                if minSum2 > target {
                    break
                }
                
                // Проверка максимально возможной суммы для текущих i и j
                let maxSum2 = sortedNums[i] + sortedNums[j] + sortedNums[n-2] + sortedNums[n-1]
                if maxSum2 < target {
                    continue
                }
                
                var left = j + 1
                var right = n - 1
                
                while left < right {
                    let sum = sortedNums[i] + sortedNums[j] + sortedNums[left] + sortedNums[right]
                    
                    if sum == target {
                        answer.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
                        
                        // Пропускаем дубликаты для третьего числа
                        while left < right && sortedNums[left] == sortedNums[left+1] {
                            left += 1
                        }
                        // Пропускаем дубликаты для четвертого числа
                        while left < right && sortedNums[right] == sortedNums[right-1] {
                            right -= 1
                        }
                        
                        left += 1
                        right -= 1
                    } else if sum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        
        return answer
    }
}
