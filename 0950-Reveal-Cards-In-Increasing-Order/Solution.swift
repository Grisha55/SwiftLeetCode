class Solution {
  func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
    let sortedDeck = deck.sorted()
    var res = [Int](repeating: 0, count: deck.count)
    var queue = [Int]()

    for i in 0..<deck.count {
      queue.append(i)
    }

    for card in sortedDeck {
      if queue.count > 1 {
        res[queue.removeFirst()] = card
        queue.append(queue.removeFirst())
      } else {
        res[queue.removeFirst()] = card
      }
    }

    return res
  }
}