//
// 2402. Meeting Rooms III
// SwiftLeetCode
//

class Solution {
    
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        // Sort meetings by their original start time
        let sortedMeetings = meetings.sorted { $0[0] < $1[0] }
        
        // Min-heap for available rooms (stores room numbers)
        var availableRooms = Heap<Int>(sort: <)
        for i in 0..<n {
            availableRooms.insert(i)
        }
        
        // Min-heap for ongoing/delayed meetings: (endTime, room, originalStart)
        var ongoingMeetings = Heap<(endTime: Int, room: Int, originalStart: Int)>(sort: {
            if $0.endTime != $1.endTime {
                return $0.endTime < $1.endTime
            }
            return $0.room < $1.room
        })
        
        var meetingCounts = Array(repeating: 0, count: n)
        
        for meeting in sortedMeetings {
            let start = meeting[0]
            let duration = meeting[1] - meeting[0]
            
            // Free up any rooms where meetings have ended
            while let current = ongoingMeetings.peek, current.endTime <= start {
                let freedRoom = ongoingMeetings.remove()!.room
                availableRooms.insert(freedRoom)
            }
            
            if !availableRooms.isEmpty {
                // Assign to smallest available room
                let room = availableRooms.remove()!
                meetingCounts[room] += 1
                ongoingMeetings.insert((start + duration, room, start))
            } else {
                // Delay the meeting - use the room that's freeing up earliest
                let earliest = ongoingMeetings.remove()!
                let delayedEndTime = earliest.endTime + duration
                meetingCounts[earliest.room] += 1
                ongoingMeetings.insert((delayedEndTime, earliest.room, start))
            }
        }
        
        // Find room with maximum meetings
        var maxCount = -1
        var resultRoom = 0
        for i in 0..<n {
            if meetingCounts[i] > maxCount || (meetingCounts[i] == maxCount && i < resultRoom) {
                maxCount = meetingCounts[i]
                resultRoom = i
            }
        }
        
        return resultRoom
    }
    
    // Heap implementation remains the same as previous solution
    
    // Heap implementation for priority queue
    struct Heap<T> {
        private var elements = [T]()
        private let sort: (T, T) -> Bool
        
        init(sort: @escaping (T, T) -> Bool) {
            self.sort = sort
        }
        
        var isEmpty: Bool {
            return elements.isEmpty
        }
        
        var peek: T? {
            return elements.first
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
            let value = elements[0]
            elements[0] = elements.removeLast()
            siftDown(from: 0)
            return value
        }
        
        private mutating func siftUp(from index: Int) {
            var child = index
            var parent = parentIndex(of: child)
            while child > 0 && sort(elements[child], elements[parent]) {
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
                if left < elements.count && sort(elements[left], elements[candidate]) {
                    candidate = left
                }
                if right < elements.count && sort(elements[right], elements[candidate]) {
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

// Helper: Heap implementation for priority queue
struct Heap<T> {
    private var elements = [T]()
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: T? {
        return elements.first
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
        let value = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        return value
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        while child > 0 && sort(elements[child], elements[parent]) {
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
            if left < elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && sort(elements[right], elements[candidate]) {
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
