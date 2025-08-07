//
// 3363. Find the Maximum Number of Fruits Collected
// SwiftLeetCode
//

class Solution {
    func maxCollectedFruits(_ fruits: [[Int]]) -> Int {
        let gridSize = fruits.count
        
        // Create a dynamic programming table initialized with fruit values
        var dpTable = fruits
        
        let centerPoint = gridSize / 2 + gridSize % 2
        
        for row in 1..<gridSize {
            // Accumulate diagonal fruits
            dpTable[row][row] += dpTable[row - 1][row - 1]
            
            if row < gridSize - 1 {
                let symmetryRange = centerPoint - abs(centerPoint - row)
                
                for col in 0...symmetryRange {
                    if row != gridSize - 1 - col {
                        // Calculate maximum fruits from possible left paths
                        let leftPathIndex1 = max(gridSize - col - 2, gridSize - symmetryRange)
                        let leftPathIndex2 = max(gridSize - col - 1, gridSize - symmetryRange)
                        let maxLeftPath = max(dpTable[row - 1][leftPathIndex1], dpTable[row - 1][leftPathIndex2])
                        
                        // Update right path in DP table
                        dpTable[row][gridSize - 1 - col] += max(maxLeftPath, dpTable[row - 1][min(gridSize - col, gridSize - 1)])
                        
                        // Calculate maximum fruits from possible top paths
                        let topPathIndex1 = max(gridSize - col - 2, gridSize - symmetryRange)
                        let topPathIndex2 = max(gridSize - col - 1, gridSize - symmetryRange)
                        let maxTopPath = max(dpTable[topPathIndex1][row - 1], dpTable[topPathIndex2][row - 1])
                        
                        // Update bottom path in DP table
                        dpTable[gridSize - 1 - col][row] += max(maxTopPath, dpTable[min(gridSize - col, gridSize - 1)][row - 1])
                    }
                }
            }
        }
        
        // Sum the three ending positions
        return dpTable[gridSize - 1][gridSize - 1] +
               dpTable[gridSize - 1][gridSize - 2] +
               dpTable[gridSize - 2][gridSize - 1]
    }
}
