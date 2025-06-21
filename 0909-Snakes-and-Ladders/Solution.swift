//
// 0909. Snakes and Ladders
// Problem: https://leetcode.com/problems/snakes-and-ladders/
// SwiftLeetCode
//

import Foundation

class Solution {

    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count

        // Flatten the 2D board into a 1D array for easy access
        var flatBoard = [Int](repeating: -1, count: n * n + 1)
        var index = 1
        var isLeftToRight = true

        // Start from the bottom row and move upwards
        for row in stride(from: n - 1, through: 0, by: -1) {
            // Determine the direction of movement in the current row
            let cols = isLeftToRight ? Array(0..<n) : Array((0..<n).reversed())
            for col in cols {
                flatBoard[index] = board[row][col] // Store the cell value
                index += 1
            }
            isLeftToRight.toggle() // Alternate direction for the next row
        }

        var visited = Set<Int>()                        // Set to keep track of visited cells
        var queue: [(pos: Int, steps: Int)] = [(1, 0)]  // Start from cell 1 with 0 moves
        visited.insert(1)

        // BFS traversal
        while !queue.isEmpty {
            let (curr, steps) = queue.removeFirst()
            if curr == n * n {
                return steps // Reached the final cell
            }

            // Try all possible dice rolls from 1 to 6
            for move in 1...6 {
                let next = curr + move
                if next > n * n { continue } // Out of board

                // Check if there's a snake or ladder at destination
                let dest = flatBoard[next] == -1 ? next : flatBoard[next]
                if !visited.contains(dest) {
                    visited.insert(dest)
                    queue.append((dest, steps + 1)) // Enqueue next move
                }
            }
        }

        return -1 // If it's not possible to reach the final cell
    }
}

/*
🐍📈 Problem statement:
We have a game of "Snakes and Ladders" on a square board n x n.
Some cells may contain:
    - ladders that take the player higher (number ≠ -1 is written);
    - snakes that take the player lower;
    - if a cell = -1 — it is a regular cell, without a snake or ladder.
Your task is to determine the minimum number of dice rolls (from 1 to 6) to get from cell 1 to cell n×n, taking into account snakes and ladders.

🧠 How to solve (in simple terms):
1. Transform the board from 2D (board[][]) to 1D (flatBoard[]) to make it easy to move around.
2. Use breadth-first search (BFS):
    - start with cell 1;
    - go through possible dice moves (from +1 to +6);
    - if the cell leads to a ladder or a snake, we jump;
    - we track the cells we have already visited;
    - as soon as we reach the final one, we return the number of steps.

🧮 Example:
Let's say:

let board = [
[-1,-1,-1,-1,-1,-1],
[-1,-1,-1,-1,-1,-1],
[-1,-1,-1,-1,-1,-1],
[-1,35,-1,-1,13,-1],
[-1,-1,-1,-1,-1,-1],
[-1,15,-1,-1,-1,-1]
]
If you roll a dice and the player lands on 2 → 3 → 4... etc., he will jump on ladders and snakes in flatBoard, which shortens the path.

📊 Complexity:
Time: O(n²) — in the worst case we will go around all the cells;

Memory: O(n²) - uses array + BFS queue + visited set.
*/
