//
// 3443. Maximum Manhattan Distance After K Changes
// SwiftLeetCode
//

import Foundation

class Solution {
    func maxDistance(_ s: String, _ k: Int) -> Int {

        // // Initialize counts for movements in each direction. These track the net movement in each direction.
        var latitude = 0 // Net movement north/south
        var longitude = 0 // Net movement east/west
        var ans = 0 // Stores the maximum distance found so far
        let n = s.count // Get the length of the input string
        let sArr = Array(s) // Convert the string to an array of characters for easier access

        // Iterate through the string of movements
        for i in 0..<n {
            switch sArr[i] {
                case "N":
                    latitude += 1  // Move north
                case "S":
                    latitude -= 1  // Move south
                case "E":
                    longitude += 1 // Move east
                case "W":
                    longitude -= 1 // Move west
                default:
                    break // Ignore valid characters
            }

            // Calculate maximum possible distance cnsidering k changes. THIS IS THE FLAWED PART!
            ans = max(ans, min(abs(latitude) + abs(longitude) + k * 2, i + 1))
        }

        // Return the maximum distance found
        return ans
    }
}
