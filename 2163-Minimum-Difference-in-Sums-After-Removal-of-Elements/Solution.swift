//
// 2163. Minimum Difference in Sums After Removal of Elements
// SwiftLeetCode
//

class Solution {
    func minimumDifference(_ nums: [Int]) -> Int {
        let n = nums.count
        let k = n / 3
        
        // Arrays to store minimum sums from left and maximum sums from right
        var leftMinSums = [Int](repeating: 0, count: n)
        var rightMaxSums = [Int](repeating: 0, count: n)
        
        // Max heap for left partition (using negative values to simulate max heap)
        var leftHeap = [Int]()
        var leftSum = 0
        
        // Min heap for right partition
        var rightHeap = [Int]()
        var rightSum = 0
        
        // Build leftMinSums array
        for i in 0..<k {
            leftSum += nums[i]
            maxHeapInsert(&leftHeap, nums[i])
        }
        leftMinSums[k-1] = leftSum
        
        for i in k..<(n - k) {
            if nums[i] < leftHeap[0] {
                leftSum += nums[i] - leftHeap[0]
                maxHeapReplace(&leftHeap, nums[i])
            }
            leftMinSums[i] = leftSum
        }
        
        // Build rightMaxSums array
        for i in (n - k)..<n {
            rightSum += nums[i]
            minHeapInsert(&rightHeap, nums[i])
        }
        rightMaxSums[n - k] = rightSum
        
        for i in stride(from: n - k - 1, through: k - 1, by: -1) {
            if nums[i] > rightHeap[0] {
                rightSum += nums[i] - rightHeap[0]
                minHeapReplace(&rightHeap, nums[i])
            }
            rightMaxSums[i] = rightSum
        }
        
        // Find minimum difference
        var minDiff = Int.max
        for i in (k - 1)..<(n - k) {
            minDiff = min(minDiff, leftMinSums[i] - rightMaxSums[i + 1])
        }
        
        return minDiff
    }
    
    // Max Heap operations
    private func maxHeapInsert(_ heap: inout [Int], _ value: Int) {
        heap.append(value)
        var i = heap.count - 1
        while i > 0 && heap[(i-1)/2] < heap[i] {
            heap.swapAt(i, (i-1)/2)
            i = (i-1)/2
        }
    }
    
    private func maxHeapReplace(_ heap: inout [Int], _ value: Int) {
        heap[0] = value
        maxHeapify(&heap, 0)
    }
    
    private func maxHeapify(_ heap: inout [Int], _ i: Int) {
        let left = 2*i + 1
        let right = 2*i + 2
        var largest = i
        
        if left < heap.count && heap[left] > heap[largest] {
            largest = left
        }
        if right < heap.count && heap[right] > heap[largest] {
            largest = right
        }
        
        if largest != i {
            heap.swapAt(i, largest)
            maxHeapify(&heap, largest)
        }
    }
    
    // Min Heap operations
    private func minHeapInsert(_ heap: inout [Int], _ value: Int) {
        heap.append(value)
        var i = heap.count - 1
        while i > 0 && heap[(i-1)/2] > heap[i] {
            heap.swapAt(i, (i-1)/2)
            i = (i-1)/2
        }
    }
    
    private func minHeapReplace(_ heap: inout [Int], _ value: Int) {
        heap[0] = value
        minHeapify(&heap, 0)
    }
    
    private func minHeapify(_ heap: inout [Int], _ i: Int) {
        let left = 2*i + 1
        let right = 2*i + 2
        var smallest = i
        
        if left < heap.count && heap[left] < heap[smallest] {
            smallest = left
        }
        if right < heap.count && heap[right] < heap[smallest] {
            smallest = right
        }
        
        if smallest != i {
            heap.swapAt(i, smallest)
            minHeapify(&heap, smallest)
        }
    }
}

/*
Time Complexity = O(nlogk), where k = n / 3
Space Complexity = O(n)
*/
