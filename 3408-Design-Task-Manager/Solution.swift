import Foundation

class TaskManager {
    // taskInfo[taskId] = (userId, priority)
    private var taskInfo: [Int: (Int, Int)]
    
    // userTasks[userId] = словарь [taskId: priority]
    private var userTasks: [Int: [Int: Int]]
    
    // Приоритетная очередь: храним (priority, taskId, userId)
    // Используем кастомную сравнивающую функцию
    private var priorityQueue: PriorityQueue<Task>
    
    private struct Task: Comparable {
        let priority: Int
        let taskId: Int
        let userId: Int
        
        static func < (lhs: Task, rhs: Task) -> Bool {
            if lhs.priority != rhs.priority {
                return lhs.priority > rhs.priority
            }
            return lhs.taskId > rhs.taskId
        }
        
        static func == (lhs: Task, rhs: Task) -> Bool {
            return lhs.priority == rhs.priority && lhs.taskId == rhs.taskId && lhs.userId == rhs.userId
        }
    }
    
    private class PriorityQueue<T: Comparable> {
        private var heap: [T]
        
        init() {
            heap = []
        }
        
        var isEmpty: Bool {
            return heap.isEmpty
        }
        
        var count: Int {
            return heap.count
        }
        
        func enqueue(_ element: T) {
            heap.append(element)
            siftUp(from: heap.count - 1)
        }
        
        func dequeue() -> T? {
            guard !heap.isEmpty else { return nil }
            heap.swapAt(0, heap.count - 1)
            let element = heap.removeLast()
            if !heap.isEmpty {
                siftDown(from: 0)
            }
            return element
        }
        
        func peek() -> T? {
            return heap.first
        }
        
        func removeAll() {
            heap.removeAll()
        }
        
        private func siftUp(from index: Int) {
            var child = index
            var parent = (child - 1) / 2
            
            while child > 0 && heap[child] < heap[parent] {
                heap.swapAt(child, parent)
                child = parent
                parent = (child - 1) / 2
            }
        }
        
        private func siftDown(from index: Int) {
            var parent = index
            let count = heap.count
            
            while true {
                let leftChild = 2 * parent + 1
                let rightChild = 2 * parent + 2
                var candidate = parent
                
                if leftChild < count && heap[leftChild] < heap[candidate] {
                    candidate = leftChild
                }
                
                if rightChild < count && heap[rightChild] < heap[candidate] {
                    candidate = rightChild
                }
                
                if candidate == parent {
                    return
                }
                
                heap.swapAt(parent, candidate)
                parent = candidate
            }
        }
    }
    
    init(_ tasks: [[Int]]) {
        taskInfo = [:]
        userTasks = [:]
        priorityQueue = PriorityQueue()
        
        for task in tasks {
            let userId = task[0]
            let taskId = task[1]
            let priority = task[2]
            add(userId, taskId, priority)
        }
    }
    
    func add(_ userId: Int, _ taskId: Int, _ priority: Int) {
        // Добавляем информацию о задаче
        taskInfo[taskId] = (userId, priority)
        
        // Добавляем в словарь пользователя
        if userTasks[userId] == nil {
            userTasks[userId] = [:]
        }
        userTasks[userId]![taskId] = priority
        
        // Добавляем в приоритетную очередь
        let task = Task(priority: priority, taskId: taskId, userId: userId)
        priorityQueue.enqueue(task)
    }
    
    func edit(_ taskId: Int, _ newPriority: Int) {
        guard let (userId, _) = taskInfo[taskId] else { return }
        
        // Обновляем информацию
        taskInfo[taskId] = (userId, newPriority)
        userTasks[userId]![taskId] = newPriority
        
        // Добавляем новую запись в очередь
        let task = Task(priority: newPriority, taskId: taskId, userId: userId)
        priorityQueue.enqueue(task)
    }
    
    func rmv(_ taskId: Int) {
        guard let (userId, _) = taskInfo[taskId] else { return }
        
        // Удаляем из словарей
        taskInfo.removeValue(forKey: taskId)
        userTasks[userId]!.removeValue(forKey: taskId)
        
        // Если у пользователя не осталось задач, удаляем его
        if userTasks[userId]!.isEmpty {
            userTasks.removeValue(forKey: userId)
        }
    }
    
    func execTop() -> Int {
        while let topTask = priorityQueue.dequeue() {
            let taskId = topTask.taskId
            let userId = topTask.userId
            let priority = topTask.priority
            
            // Проверяем, актуальна ли задача
            if let (currentUserId, currentPriority) = taskInfo[taskId],
               currentUserId == userId,
               currentPriority == priority {
                
                // Удаляем задачу
                rmv(taskId)
                return userId
            }
        }
        return -1
    }
}

/**
 * Your TaskManager object will be instantiated and called as such:
 * let obj = TaskManager(tasks)
 * obj.add(userId, taskId, priority)
 * obj.edit(taskId, newPriority)
 * obj.rmv(taskId)
 * let ret_4: Int = obj.execTop()
 */