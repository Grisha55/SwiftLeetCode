class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = board.count
        var cols = board[0].count
        var columns = [Character]()
        var triplets = [Character]()
        
        // Check rows for duplicates
        for i in 0..<rows {
            if containDuplicates(board[i]) {
                return false
            }
        }

        // Check columns for duplicates
        for i in 0..<cols {
            for j in 0..<rows {
                columns.append(board[j][i])
            }
            if containDuplicates(columns) {
                return false
            }
            columns.removeAll()
        }

        // Check triplets for duplicates
        for boxRow in 0..<3 {
            for boxCol in 0..<3 {
                var box = [Character]()
                for i in 0..<3 {
                    for j in 0..<3 {
                        let row = boxRow * 3 + i
                        let col = boxCol * 3 + j
                        box.append(board[row][col])
                    }
                }
                if containDuplicates(box) {
                    return false
                }
            }
        }
        
        return true

    }

    private func containDuplicates(_ arr: [Character]) -> Bool {
        var copies = Set<Character>()

        for char in arr {
            if char != Character(".") {
                if copies.contains(char) {
                    return true
                }
                copies.insert(char)
            }
        }
        
        return false
    }
}