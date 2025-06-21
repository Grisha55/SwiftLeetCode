//
// 1298. Maximum Candies You Can Get from Boxes
// Problem: https://leetcode.com/problems/maximum-candies-you-can-get-from-boxes/
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxCandies(_ status: [Int], _ candies: [Int], _ keys: [[Int]], _ containedBoxes: [[Int]], _ initialBoxes: [Int]) -> Int {
        // Total candies collected.
        var totalCandies = 0
        // Boxes we currently possess.
        var ownedBoxes = Set(initialBoxes)
        // Keys we've found.
        var availableKeys = Set<Int>()
        // Boxes we've already opened.
        var opened = Set<Int>()
        // Queue of boxes to process. Start with initial boxes.
        var queue = initialBoxes

        // Process boxes until the queue is empty.
        while !queue.isEmpty {
            // Create a new queue for the next iteration.
            var nextQueue: [Int] = []
            // Process each box in the current queue.
            for box in queue {
                // Skip already opened boxes.
                if opened.contains(box) {
                    continue
                }

                // Skip locked boxes if we don't have the key.
                if status[box] == 0 && !availableKeys.contains(box) {
                    continue
                }

                // Open the box!
                opened.insert(box)
                // Collect the candies.
                totalCandies += candies[box]

                // Get new keys from the box.
                for key in keys[box] {
                    availableKeys.insert(key)
                    // Add any keys we already own to the next queue.
                    if ownedBoxes.contains(key) && !opened.contains(key) {
                        nextQueue.append(key)
                    }
                }

                // Get new boxes from the box.
                for newBox in containedBoxes[box] {
                    // Add any new boxes we didn't own to our inventory.
                    if !ownedBoxes.contains(newBox) {
                        ownedBoxes.insert(newBox)
                    }
                    // Add all new boxes to the next queue.
                    nextQueue.append(newBox)
                }
            }

            // Move to the next level of boxes.
            queue = nextQueue
        }

        // Return the total candies collected.
        return totalCandies
    }
}

/*
Explanation in Simple Terms:

The function simulates opening boxes one by one. It uses a queue to manage the order of boxes to open. Initially, the queue contains the `initialBoxes`. The algorithm iteratively processes the boxes in the queue:

1. Check if openable: It skips already opened boxes or locked boxes for which it doesn't possess the key.

2. Open and collect: If a box is openable, it's marked as opened, and the candies inside are added to the `totalCandies`.

3. Acquire keys and boxes: Any keys and boxes inside the opened box are added to the appropriate sets (`availableKeys` and `ownedBoxes`). Newly acquired boxes are added to the `nextQueue` for processing in the next iteration, while newly acquired keys are only added to the next queue if we already possess them (preventing infinite loops).


This continues until the queue is empty, meaning no more boxes can be opened. The function then returns the total candies collected. The use of sets (`ownedBoxes`, `availableKeys`, `opened`) ensures efficient lookups. The use of a queue ensures a breadth-first search approach to opening boxes, preventing potential infinite loops. The time and space complexity are approximately O(N), where N is the total number of boxes and keys.
*/
