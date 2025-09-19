
class Spreadsheet {
    private var rows: Int
    private var grid: [[Int]]

    init(_ rows: Int) {
        self.rows = rows
        self.grid = Array(repeating: Array(repeating: 0, count: 26), count: rows)    
    }

    private func parseCell(_ cell: String) -> (Int, Int)? {
        guard let colChar = cell.first, 
              let colAscii = colChar.asciiValue, 
              colAscii >= Character("A").asciiValue!,
              colAscii <= Character("Z").asciiValue! else {
            return nil
        }

        let colIndex = Int(colAscii - Character("A").asciiValue!)
        guard let rowIndex = Int(cell.dropFirst()) else { return nil }

        if rowIndex < 1 || rowIndex > rows {
            return nil
        }

        return (rowIndex - 1, colIndex)
    }
    
    func setCell(_ cell: String, _ value: Int) {
        if let (r, c) = parseCell(cell) {
            grid[r][c] = value
        }
    }
    
    func resetCell(_ cell: String) {
        if let (r, c) = parseCell(cell) {
            grid[r][c] = 0
        }
    }
    
    func getValue(_ formula: String) -> Int {
        guard formula.first == "=" else { return 0 }
        let expr = formula.dropFirst().split(separator: "+")

        if expr.count != 2 {
            return 0
        }

        return parseOperand(String(expr[0])) + parseOperand(String(expr[1]))
    }

    private func parseOperand(_ operand: String) -> Int {
        if let val = Int(operand) {
            return val
        } else if let (r, c) = parseCell(operand) {
            return grid[r][c]
        }

        return 0
    }
}

/**
 * Your Spreadsheet object will be instantiated and called as such:
 * let obj = Spreadsheet(rows)
 * obj.setCell(cell, value)
 * obj.resetCell(cell)
 * let ret_3: Int = obj.getValue(formula)
 */