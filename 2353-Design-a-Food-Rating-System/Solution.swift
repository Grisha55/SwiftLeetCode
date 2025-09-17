class FoodRatings {
    private var foodInfo: [String: (cuisine: String, rating: Int)]
    private var cuisineHeaps: [String: Heap<Food>]

    init(_ foods: [String], _ cuisines: [String], _ ratings: [Int]) {
        foodInfo = [:]
        cuisineHeaps = [:]

        for i in 0..<foods.count {
            let food = foods[i]
            let cuisine = cuisines[i]
            let rating = ratings[i]

            foodInfo[food] = (cuisine, rating)

            if cuisineHeaps[cuisine] == nil {
                cuisineHeaps[cuisine] = Heap<Food>(sort: { a, b in
                    if a.rating != b.rating {
                        return a.rating > b.rating
                    } else {
                        return a.name < b.name
                    }
                })
            }

            cuisineHeaps[cuisine]!.insert(Food(name: food, rating: rating))
        }
    }

    func changeRating(_ food: String, _ newRating: Int) {
        guard let (cuisine, _) = foodInfo[food] else { return }

        // обновляем рейтинг в словаре
        foodInfo[food] = (cuisine, newRating)

        // просто кладём новую версию в кучу
        cuisineHeaps[cuisine]?.insert(Food(name: food, rating: newRating))
    }

    func highestRated(_ cuisine: String) -> String {
        guard var heap = cuisineHeaps[cuisine] else { return "" }

        // пока вершина не совпадает с актуальной — убираем её
        while let top = heap.peek() {
            if let (_, rating) = foodInfo[top.name], rating == top.rating {
                return top.name
            } else {
                _ = heap.remove()
                cuisineHeaps[cuisine] = heap // обновляем кучу после удаления
            }
        }

        return ""
    }
}

struct Food: Equatable {
    let name: String
    let rating: Int
}

struct Heap<T> {
    private var elements: [T]
    private let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.elements = []
        self.sort = sort
    }

    func peek() -> T? {
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
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            siftDown(from: 0)
            return value
        }
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
