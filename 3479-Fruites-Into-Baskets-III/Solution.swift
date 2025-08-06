class Solution {
  func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
    fruits.count{[tree=SegmentTree(baskets)] f in !tree.removeLeftmost(f)}
  }
}

class SegmentTree {
    var tree: [Int]
    var n: Int
    
    init(_ arr: [Int]) {
        n = arr.count
        tree = Array(repeating: 0, count: 4 * n)
        build(arr, 1, 0, n - 1)
    }
    
    func build(_ arr: [Int], _ node: Int, _ start: Int, _ end: Int) {
        if start == end {
            tree[node] = arr[start]
        } else {
            let mid = (start + end) / 2
            build(arr, 2 * node, start, mid)
            build(arr, 2 * node + 1, mid + 1, end)
            tree[node] = max(tree[2 * node], tree[2 * node + 1])
        }
    }
    
    func removeLeftmost(_ val: Int) -> Bool {
        guard let idx = findLeftmost(val) else { return false }
        func inner(_ node: Int, _ start: Int, _ end: Int) {
            if start == end {
                tree[node] = 0
            } else {
                let mid = (start + end) / 2
                if idx <= mid {
                    inner(2*node, start, mid)
                } else {
                    inner(2*node+1, mid+1, end)
                }
                tree[node] = max(tree[2 * node], tree[2 * node + 1])
            }
        }
        inner(1, 0, n - 1)
        return true
    }
    
    func findLeftmost(_ minVal: Int) -> Int? {
        func inner(_ node: Int, _ start: Int, _ end: Int) -> Int? {
            guard tree[node] >= minVal else { return nil }
            guard start < end else { return start }
            let mid = (start + end) / 2
            return inner(2*node, start, mid) ?? inner(2*node+1, mid+1, end)
        }
        return inner(1, 0, n - 1)
    }
}