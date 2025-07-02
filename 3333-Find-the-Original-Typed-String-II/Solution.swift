class Solution {
    func possibleStringCount(_ word: String, _ k: Int) -> Int {
        let mod = 1_000_000_007
        let n = word.count
        let chars = Array(word)
        
        var count = 1
        var duplicates = [Int]()
        
        // Step 1: Group consecutive identical characters and count their frequency
        for i in 1..<n {
            if chars[i] == chars[i - 1] {
                count += 1
            } else {
                duplicates.append(count)
                count = 1
            }
        }
        duplicates.append(count) // Don't forget the last group

        // Step 2: Calculate total combinations for each group (choices: pick 1 to freq[i] characters)
        var total = 1
        for f in duplicates {
            total = total * f % mod
        }

        // Step 3: If we already have at least k groups, all total combinations are valid
        if duplicates.count >= k {
            return total
        }

        // Step 4: Use dynamic programming to count how many combinations produce original strings of length < k

        // f[i] = number of ways to create a string of length i
        var d = [Int](repeating: 0, count: k)
        d[0] = 1

        // g[i] = prefix sum of f[0...i]
        var g = [Int](repeating: 0, count: k)
        g[0] = 1
        for i in 1..<k {
            g[i] = (g[i - 1] + d[i]) % mod
        }

        // Process each group frequency
        for dupValue in duplicates {
            var newD = [Int](repeating: 0, count: k)
            for j in 1..<k {
                // Include all combinations that end at position j using up to freqValue characters
                newD[j] = g[j - 1]
                if j - dupValue - 1 >= 0 {
                    newD[j] = (newD[j] - g[j - dupValue - 1] + mod) % mod
                }
            }

            // Update prefix sums for new f
            var newG = [Int](repeating: 0, count: k)
            newG[0] = newD[0]
            for j in 1..<k {
                newG[j] = (newG[j - 1] + newD[j]) % mod
            }

            d = newD
            g = newG
        }

        // Step 5: Subtract number of invalid combinations (original length < k) from total
        return (total - g[k - 1] + mod) % mod
    }
}

/*
🧠 Brief explanation of the logic
    1. First we group identical characters and count the number of repetitions of each character in a row.
    2. Then we calculate the total number of combinations: for each block of g characters there are g variants (there could be 1...g characters left in the original string).
    3. If there are ≥ k such groups, then all combinations are valid.
    4. Otherwise, we use dynamic programming to count how many invalid combinations lead to strings of length < k.
    5. The answer is all combinations minus the invalid ones.
*/
