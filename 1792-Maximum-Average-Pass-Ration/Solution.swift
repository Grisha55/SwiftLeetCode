class Solution {
  func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
    // Создаем max-heap (приоритетную очередь), где будем хранить классы
    // Ключом будет прирост соотношения, который мы получим, добавив одного студента
    var heap = Heap<(delta: Double, pass: Int, total: Int)> { $0.delta > $1.delta }
    
    // Инициализируем кучу, вычисляя первоначальный прирост для каждого класса
    for classInfo in classes {
        let pass = classInfo[0]
        let total = classInfo[1]
        let delta = calculateDelta(pass: pass, total: total)
        heap.insert((delta, pass, total))
    }
    
    var remainingExtraStudents = extraStudents
    
    // Распределяем всех экстра-студентов
    while remainingExtraStudents > 0 {
        guard let current = heap.remove() else { break }
        
        let newPass = current.pass + 1
        let newTotal = current.total + 1
        let newDelta = calculateDelta(pass: newPass, total: newTotal)
        
        heap.insert((newDelta, newPass, newTotal))
        remainingExtraStudents -= 1
    }
    
    // Вычисляем итоговое среднее соотношение
    var totalRatio: Double = 0.0
    while !heap.isEmpty {
        guard let classInfo = heap.remove() else { break }
        totalRatio += Double(classInfo.pass) / Double(classInfo.total)
    }
    
    return totalRatio / Double(classes.count)
}

// Функция для вычисления прироста соотношения при добавлении одного студента
private func calculateDelta(pass: Int, total: Int) -> Double {
    let currentRatio = Double(pass) / Double(total)
    let newRatio = Double(pass + 1) / Double(total + 1)
    return newRatio - currentRatio
}

// Реализация структуры Heap (приоритетной очереди)
struct Heap<T> {
    private var elements: [T] = []
    private let comparator: (T, T) -> Bool
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    init(comparator: @escaping (T, T) -> Bool) {
        self.comparator = comparator
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeLast()
        }
        
        elements.swapAt(0, elements.count - 1)
        let value = elements.removeLast()
        siftDown(from: 0)
        return value
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        
        while child > 0 && comparator(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(of: parent)
            let right = rightChildIndex(of: parent)
            var candidate = parent
            
            if left < elements.count && comparator(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < elements.count && comparator(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}
}