class Solution {
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        var baskets = baskets
        var unplacedTypes = 0

        for fruit in fruits {
            var placed = false
            for i in 0..<baskets.count {
                if baskets[i] >= fruit {
                    baskets[i] = -1
                    placed = true
                    break
                }
            }

            if !placed {
                unplacedTypes += 1
            }
        }

        return unplacedTypes
    }
}

/*
Time Complexity - O(n^2)
Space Complexity - O(n)
*/
