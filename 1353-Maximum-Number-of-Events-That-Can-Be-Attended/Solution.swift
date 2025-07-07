//
// 1353. Maximum Number of Events That Can Be Attended
// SwiftLeetCode
//

class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        // Sort events by their start day in ascending order
        let sortedEvents = events.sorted { $0[0] < $1[0] }
        
        // Min-heap to keep track of end days of available events
        var minHeap = Heap<Int>(sort: <)
        
        var currentDay = 1
        var eventIndex = 0
        var attendedEvents = 0
        
        while eventIndex < sortedEvents.count || !minHeap.isEmpty {
            // Add all events that start on or before currentDay to the heap
            while eventIndex < sortedEvents.count && sortedEvents[eventIndex][0] <= currentDay {
                minHeap.insert(sortedEvents[eventIndex][1])
                eventIndex += 1
            }
            
            // Remove events that have already ended before currentDay
            while !minHeap.isEmpty && minHeap.peek()! < currentDay {
                minHeap.remove()
            }
            
            // If there's an available event, attend it (the one that ends earliest)
            if !minHeap.isEmpty {
                minHeap.remove()
                attendedEvents += 1
            }
            
            // Move to the next day
            currentDay += 1
        }
        
        return attendedEvents
    }
    
    // Helper: Min-Heap implementation
    struct Heap<Element> {
        var elements: [Element]
        let sort: (Element, Element) -> Bool
        
        init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
            self.sort = sort
            self.elements = elements
            buildHeap()
        }
        
        var isEmpty: Bool {
            return elements.isEmpty
        }
        
        var count: Int {
            return elements.count
        }
        
        func peek() -> Element? {
            return elements.first
        }
        
        mutating func buildHeap() {
            for index in (0 ..< elements.count / 2).reversed() {
                siftDown(from: index)
            }
        }
        
        mutating func siftDown(from index: Int) {
            var parent = index
            while true {
                let left = leftChildIndex(ofParentAt: parent)
                let right = rightChildIndex(ofParentAt: parent)
                var candidate = parent
                
                if left < count && sort(elements[left], elements[candidate]) {
                    candidate = left
                }
                if right < count && sort(elements[right], elements[candidate]) {
                    candidate = right
                }
                if candidate == parent {
                    return
                }
                elements.swapAt(parent, candidate)
                parent = candidate
            }
        }
        
        mutating func siftUp(from index: Int) {
            var child = index
            var parent = parentIndex(ofChildAt: child)
            while child > 0 && sort(elements[child], elements[parent]) {
                elements.swapAt(child, parent)
                child = parent
                parent = parentIndex(ofChildAt: child)
            }
        }
        
        mutating func insert(_ element: Element) {
            elements.append(element)
            siftUp(from: count - 1)
        }
        
        mutating func remove() -> Element? {
            guard !isEmpty else { return nil }
            elements.swapAt(0, count - 1)
            defer {
                siftDown(from: 0)
            }
            return elements.removeLast()
        }
        
        func leftChildIndex(ofParentAt index: Int) -> Int {
            return (2 * index) + 1
        }
        
        func rightChildIndex(ofParentAt index: Int) -> Int {
            return (2 * index) + 2
        }
        
        func parentIndex(ofChildAt index: Int) -> Int {
            return (index - 1) / 2
        }
    }
}

/*
 
 Explanation:
 
 1. Sorting Events: First, we sort all events by their start day. This helps us process events in chronological order.

 2. Min-Heap Data Structure: We use a min-heap to keep track of events that are available to attend on the current day. The heap stores end days of events, allowing us to always pick the event that ends soonest.

 3. Processing Events:

    - For each day, we add all events that start on or before that day to the heap.

    - We remove any events from the heap that have already ended before the current day.

    - If there are events available, we attend the one that ends earliest (removing it from the heap) and increment our count.

 4. Heap Implementation: The Heap struct is a generic implementation of a heap that can be configured as a min-heap or max-heap based on the sorting function provided.

 Time Complexity:
    - Sorting events takes O(n log n)
    - Each event is added and removed from the heap once, with heap operations taking O(log n)

    - Overall complexity is O(n log n)

 Space Complexity:
    - O(n) for storing events in the heap

 
This solution efficiently maximizes the number of events one can attend by always choosing the event that will free up days for future events the soonest.
 
 */
