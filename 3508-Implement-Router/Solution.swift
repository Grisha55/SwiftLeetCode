struct Packet: Hashable {
    let source: Int
    let destination: Int
    let timestamp: Int
}

class Router {
    private let memoryLimit: Int
    private var queue: [Packet] = []
    private var packetSet: Set<Packet> = []
    private var destMap: [Int: [Int]] = [:] // destination -> sorted timestamps
    
    init(_ memoryLimit: Int) {
        self.memoryLimit = memoryLimit
    }
    
    func addPacket(_ source: Int, _ destination: Int, _ timestamp: Int) -> Bool {
        let packet = Packet(source: source, destination: destination, timestamp: timestamp)
        
        // Проверка на дубликат
        if packetSet.contains(packet) {
            return false
        }
        
        // Если лимит памяти превышен → удаляем старейший
        if queue.count == memoryLimit {
            let oldest = queue.removeFirst()
            packetSet.remove(oldest)
            if var arr = destMap[oldest.destination] {
                // удаляем первый timestamp
                arr.removeFirst()
                destMap[oldest.destination] = arr
            }
        }
        
        // Добавляем новый пакет
        queue.append(packet)
        packetSet.insert(packet)
        destMap[destination, default: []].append(timestamp)
        
        return true
    }
    
    func forwardPacket() -> [Int] {
        guard !queue.isEmpty else { return [] }
        
        let packet = queue.removeFirst()
        packetSet.remove(packet)
        
        if var arr = destMap[packet.destination] {
            arr.removeFirst()
            destMap[packet.destination] = arr
        }
        
        return [packet.source, packet.destination, packet.timestamp]
    }
    
    func getCount(_ destination: Int, _ startTime: Int, _ endTime: Int) -> Int {
        guard let arr = destMap[destination] else { return 0 }
        
        // бинарный поиск (lowerBound, upperBound)
        let left = lowerBound(arr, startTime)
        let right = upperBound(arr, endTime)
        return max(0, right - left)
    }
    
    // Бинарный поиск: первый индекс >= target
    private func lowerBound(_ arr: [Int], _ target: Int) -> Int {
        var l = 0, r = arr.count
        while l < r {
            let m = (l + r) / 2
            if arr[m] < target {
                l = m + 1
            } else {
                r = m
            }
        }
        return l
    }
    
    // Бинарный поиск: первый индекс > target
    private func upperBound(_ arr: [Int], _ target: Int) -> Int {
        var l = 0, r = arr.count
        while l < r {
            let m = (l + r) / 2
            if arr[m] <= target {
                l = m + 1
            } else {
                r = m
            }
        }
        return l
    }
}


/**
 * Your Router object will be instantiated and called as such:
 * let obj = Router(memoryLimit)
 * let ret_1: Bool = obj.addPacket(source, destination, timestamp)
 * let ret_2: [Int] = obj.forwardPacket()
 * let ret_3: Int = obj.getCount(destination, startTime, endTime)
 */