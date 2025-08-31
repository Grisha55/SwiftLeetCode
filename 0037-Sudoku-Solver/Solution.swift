class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        solve(&board)
    }

    private func solve(_ board: inout [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    for num in 1...9 {
                        let char = Character(String(num))
                        if isValid(board, i, j, char) {
                            board[i][j] = char

                            if solve(&board) {
                                return true
                            }

                            board[i][j] = "."
                        }
                    }
                    return false
                }
            }
        }
        return true
    }

    private func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ num: Character) -> Bool {
        for i in 0..<9 {
            if board[row][i] == num {
                return false
            }
        }

        for i in 0..<9 {
            if board[i][col] == num {
                return false
            }
        }

        let startRow = (row / 3) * 3
        let startCol = (col / 3) * 3

        for i in startRow..<startRow + 3 {
            for j in startCol..<startCol + 3 {
                if board[i][j] == num {
                    return false
                }
            }
        }

        return true
    }
}