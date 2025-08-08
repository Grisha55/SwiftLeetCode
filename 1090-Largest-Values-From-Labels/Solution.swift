class Solution {
  func largestValsFromLabels(_ values: [Int], _ labels: [Int], _ numWanted: Int, _ useLimit: Int) -> Int {
    var labelCount = [Int: Int]()
    var valueLabelPairs = [(value: Int, label: Int)]()

    for (value, label) in zip(values, labels) {
      valueLabelPairs.append((value, label))
    }

    // Sort pairs by value in descending order
    valueLabelPairs.sort { $0.value > $1.value }
    
    var totalValue = 0
    var itemsChosen = 0

    for (value, label) in valueLabelPairs {
      if itemsChosen < numWanted {
        if labelCount[label, default: 0] < useLimit {
          totalValue += value
          itemsChosen += 1
          labelCount[label, default: 0] += 1
        }
      }
    }

    return totalValue
  }
}